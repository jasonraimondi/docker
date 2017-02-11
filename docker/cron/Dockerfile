FROM php:7.1-fpm

RUN apt-get update && apt-get install -y supervisor cron vim

COPY supervisord.conf /etc/supervisord.conf

COPY crontab.txt /var/crontab.txt
RUN crontab /var/crontab.txt
RUN chmod 600 /etc/crontab

CMD ["/usr/bin/supervisord", "-n", "-c /etc/supervisord.conf"]
