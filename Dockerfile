FROM debian
USER root
RUN apt update && apt upgrade; \
    apt install -y apache2 libapache2-mod-wsgi-py3 python3-pip; \
    pip3 install flask flask_restful sqlalchemy uptime; \
    mkdir -p /var/www/html/python/templates; \
    rm /etc/apache2/sites-enabled/*; \
ADD board.wsgi /var/www/html/python/
ADD templates/index.html /var/www/html/python/templates
ADD herrhornberger.de.conf /etc/apache2/sites-enabled
RUN chmod +x /var/www/html/python/board.wsgi; \
    rm /var/www/html/index.html; \
    mkdir -p /run/apache2; \
    chgrp -R 0 /run/apache2 /etc/apache2 /var/log/apache2 /var/www; \
    chmod -R g=u /run/apache2/ /etc/apache2 /var/log/apache2 /var/www
EXPOSE 8080
CMD ["apachectl", "-D", "FOREGROUND"]
