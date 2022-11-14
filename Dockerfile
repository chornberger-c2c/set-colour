FROM ubi8 
USER root
RUN yum -y update; \
    yum install -y httpd python3-mod_wsgi python3-pip; \
    pip3 install flask flask_restful sqlalchemy uptime; \
    mkdir -p /var/www/html/python/templates; \
ADD board.wsgi /var/www/html/python/
ADD templates/index.html /var/www/html/python/templates
ADD herrhornberger.de.conf /etc/httpd/sites-enabled
RUN chmod +x /var/www/html/python/board.wsgi; \
    rm /var/www/html/index.html; \
    mkdir -p /run/httpd; \
    chgrp -R 0 /run/httpd /etc/httpd /var/log/httpd /var/www; \
    chmod -R g=u /run/httpd/ /etc/httpd /var/log/httpd /var/www
EXPOSE 8080
CMD ["apachectl", "-D", "FOREGROUND"]
