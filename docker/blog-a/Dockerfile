FROM ubuntu:22.04

RUN apt update
RUN apt install -y nginx
RUN apt install -y git
RUN apt install cron

COPY blog-pull-cronjob /etc/cron.d/
RUN crontab /etc/cron.d/blog-pull-cronjob

RUN rm -rf /var/www/html
RUN git clone https://github.com/pySatellite/pysatellite.blog.git /var/www/html
COPY pull.sh /var/www/html

CMD service cron start;nginx -g 'daemon off;'

