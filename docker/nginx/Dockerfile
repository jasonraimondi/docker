FROM nginx:latest

RUN echo 'deb http://ftp.debian.org/debian jessie-backports main' | tee /etc/apt/sources.list.d/backports.list \
    && apt-get update \
    && apt-get install -y certbot -t jessie-backports python2.7

COPY ./nginx.conf /etc/nginx/nginx.conf
ADD ./conf.d/ /etc/nginx/conf.d

EXPOSE 80 443

WORKDIR /var/www/html

CMD ["nginx"]
