FROM debian
USER root
RUN apt update && apt upgrade
RUN apt install -y apache2 libapache2-mod-wsgi-py3 python3-pip 
RUN pip3 install flask flask_restful sqlalchemy
ADD board.wsgi /var/www/html/pyhon/
ADD colour.db /var/www/html/pyhon/
ADD herrhornberger.de.conf /etc/apache2/sites-enabled
EXPOSE 80
CMD ["apachectl", "-D", "FOREGROUND"]
