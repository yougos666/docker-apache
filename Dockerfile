FROM ubuntu:latest

# Prevent some error messages
ENV DEBIAN_FRONTEND noninteractive

# Install latest updates and mysql
RUN apt-get update;apt-get upgrade -y; apt-get -y install vim apache2 supervisor wget curl php5 php5-mysql php5-gd php5-cli php5-curl php-apc git mysql-client-5.5 php5-dev php-pear php5-dev php5-intl php5-xsl openssh-client

ADD start.sh /usr/local/bin/start.sh
RUN chmod -v +x /usr/local/bin/start.sh

ADD supervisord.conf /etc/supervisord.conf

EXPOSE 80

CMD ["/usr/local/bin/start.sh"]
