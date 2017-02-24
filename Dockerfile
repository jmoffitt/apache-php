# Docker version 1.13.0-rc5
# v 1.1.0

FROM ubuntu:xenial
MAINTAINER J. Patrick Moffitt (zuryn@zuryn.net)
# Maintainer is a relative term in this case

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && apt-get -y install apt-utils
RUN apt-get -y upgrade
RUN apt-get -y install apache2=2.4.18-2ubuntu3.1 libapache2-mod-php7.0=7.0.15-0ubuntu0.16.04.2 php7.0-pgsql=7.0.15-0ubuntu0.16.04.2
RUN echo "ServerName $HOSTNAME" >> /etc/apache2/apache2.conf

EXPOSE 80

VOLUME ["/var/www", "/var/log/apache2", "/etc/apache2"]

ENTRYPOINT ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]
