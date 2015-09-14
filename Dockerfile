FROM linuxserver/baseimage.nginx
MAINTAINER Your Name <your@email.com>
ENV APTLIST="nginx redis php5 php5-fpm php5-common php-apc php5-mcrypt php5-cli php5-curl php5-mcrypt php5-redis"
#Applying stuff
RUN apt-get update -q && \
apt-get install -yq $APTLIST && \

apt-get clean && rm -rf /tmp/* /var/lib/apt/lists/* /var/tmp/*


#Adding Custom files
ADD init/ /etc/my_init.d/
ADD services/ /etc/service/
ADD cron/ /etc/cron.d/
ADD defaults/ /defaults/
RUN chmod -v +x /etc/service/*/run && chmod -v +x /etc/my_init.d/*.sh


# Volumes and Ports
VOLUME /config
EXPOSE 80 443

