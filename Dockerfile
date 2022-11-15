FROM almalinux:8 
USER root
RUN yum -y update; \
    yum install -y httpd python3-mod_wsgi python3-pip python3-sqlalchemy; \
    pip3 install flask flask_restful uptime; \
    mkdir -p /var/www/html/python/templates;
ADD board.wsgi /var/www/html/python/
ADD templates/index.html /var/www/html/python/templates
ADD site.conf /etc/httpd/conf.d/
RUN chmod +x /var/www/html/python/board.wsgi; \
    rm /var/www/html/index.html; \
    sed -i "s/Listen 80/Listen 8080/" /etc/httpd/conf/httpd.conf; \
    sed -i "s|.*|#&|g" /etc/httpd/conf.d/welcome.conf; \
    mkdir -p /run/httpd; \
    chgrp -R 0 /run/httpd /etc/httpd /var/log/httpd /var/www; \
    chmod -R g=u /run/httpd/ /etc/httpd /var/log/httpd /var/www
EXPOSE 8080
CMD ["apachectl", "-D", "FOREGROUND"]
