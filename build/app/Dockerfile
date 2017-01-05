FROM php:7.1-fpm

MAINTAINER Jason Raimondi <jason@raimondi.us>

RUN apt-key adv --keyserver hkp://pgp.mit.edu:80 --recv-keys 573BFD6B3D8FBC641079A6ABABF5BD827BD9BF62 \
    && echo "deb http://nginx.org/packages/mainline/debian/ jessie nginx" >> /etc/apt/sources.list \
    && apt-get update \
    && apt-get install --no-install-recommends --no-install-suggests -y \
      ca-certificates nginx \
    && rm /etc/nginx/conf.d/default.conf \
    && apt-get install --no-install-recommends --no-install-suggests -y \
        pkg-config \
        libssl-dev \
        libcurl4-openssl-dev \
        libbz2-dev \
        libicu-dev \
        libmcrypt-dev \
        zlib1g-dev \
        curl \
        sqlite3 \
        supervisor \
        git \
        netcat \
        vim \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* \
    && rm -rf /var/www/html

RUN docker-php-ext-install \
        intl \
        mbstring \
        mcrypt \
        pcntl \
        pdo \
        pdo_mysql \
        zip \
        opcache \

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/bin/ --filename=composer

COPY ./etc/supervisord.conf /etc/supervisord.conf

COPY ./etc/nginx/nginx.conf /etc/nginx/nginx.conf
ADD ./etc/nginx/conf.d/ /etc/nginx/conf.d

ADD ./etc/php/fpm/php-fpm.d/ /usr/local/etc/php-fpm.d
COPY ./etc/php/fpm/php.ini /usr/local/etc/php/php.ini

WORKDIR /var/www/html

EXPOSE 80 443 9000

COPY ./bin/run.sh /usr/local/bin/
RUN chmod a+x /usr/local/bin/run.sh

CMD /usr/local/bin/run.sh
