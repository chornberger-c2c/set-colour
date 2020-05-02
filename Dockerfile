FROM debian
USER root
RUN apt update && apt upgrade
RUN apt install -y apache2 libapache2-mod-wsgi-py3 python3-pip 
RUN pip3 install flask flask_restful sqlalchemy
RUN mkdir -p /var/www/html/python/templates
ADD board.wsgi /var/www/html/python/
RUN chmod +x /var/www/html/python/board.wsgi
ADD colour.db /var/www/html/python/
RUN chmod +w /var/www/html/python/colour.db
ADD templates/index.html /var/www/html/python/templates
RUN a2enmod wsgi
RUN chown -R www-data /var/www/html/python
RUN rm /var/www/html/index.html
ADD herrhornberger.de.conf /etc/apache2/sites-enabled
EXPOSE 80
CMD ["apachectl", "-D", "FOREGROUND"]
