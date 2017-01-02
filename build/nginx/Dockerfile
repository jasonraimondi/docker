FROM debian:jessie

MAINTAINER Jason Raimondi <jason@raimondi.us>

RUN apt-key adv --keyserver hkp://pgp.mit.edu:80 --recv-keys 573BFD6B3D8FBC641079A6ABABF5BD827BD9BF62 \
    && echo "deb http://nginx.org/packages/mainline/debian/ jessie nginx" >> /etc/apt/sources.list \
    && apt-get update \
    && apt-get install --no-install-recommends --no-install-suggests -y \
      ca-certificates nginx \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* \
    && rm -rf /var/www/html

COPY ./etc/nginx/nginx.conf /etc/nginx/nginx.conf

ADD ./etc/nginx/conf.d/ /etc/nginx/conf.d
ADD default /etc/nginx/sites-available/default

EXPOSE 80
CMD ["nginx"]
