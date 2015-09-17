FROM linuxserver/baseimage.nginx
MAINTAINER Your Name <your@email.com>
ENV APTLIST="nginx redis-server git redis-tools php5 php5-fpm php5-common php5-apcu php5-mcrypt php5-cli php5-curl libgd-dev php5-redis" BUILDLIST="build-essential"
#Applying stuff
RUN apt-get update -q && \
apt-get install -yq $APTLIST $BUILDLIST && \
curl -o /tmp/vnstat.tar.gz http://humdi.net/vnstat/vnstat-1.14.tar.gz && \
cd /tmp && \
tar xvf /tmp/vnstat.tar.gz && \
cd vnstat-* && \
make && \
make install && \
apt-get purge -y --remove $BUILDLIST && \
apt-get -y autoremove && \
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

