FROM ubuntu:latest

# Prevent some error messages
ENV DEBIAN_FRONTEND noninteractive

# Install latest updates and mysql
RUN apt-get update;apt-get upgrade -y; apt-get -y install vim apache2 supervisor wget curl 

ADD start.sh /usr/local/bin/start.sh
RUN chmod -v +x /usr/local/bin/start.sh

ADD supervisord.conf /etc/supervisord.conf

EXPOSE 80

CMD ["/usr/local/bin/start.sh"]
