# Docker version 1.12rc4
# Adapted from eboraas/apache-php by jmoffitt

FROM eboraas/apache:stretch
MAINTAINER Ed Boraas <ed@boraas.ca>

RUN apt-get update && apt-get -y install php php-pgsql libapache2-mod-php && apt-get clean && rm -r /var/lib/apt/lists/*
RUN /usr/sbin/a2dismod 'mpm_*' && /usr/sbin/a2enmod mpm_prefork

EXPOSE 80

CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]
