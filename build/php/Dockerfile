FROM debian:jessie

MAINTAINER Jason Raimondi <jason@raimondi.us>

ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

RUN apt-get update \
    && apt-get install -y --no-install-recommends --no-install-suggests \ 
       aptitude \
    && apt-get purge locales \
    && aptitude install locales \
    && dpkg-reconfigure locales \
    && locale-gen en_US.UTF-8 \
    && apt-get install -y --no-install-recommends --no-install-suggests \
        curl \
        supervisor \
        wget \
        zip \
        unzip \
        git \
        software-properties-common \
        apt-transport-https \
        lsb-release \
        ca-certificates \
        build-essential \
        autoconf
        
RUN apt-get install -y --no-install-recommends --no-install-suggests \
        libfcgi-dev libfcgi0ldbl libjpeg62-turbo-dbg libmcrypt-dev libssl-dev libc-client2007e libc-client2007e-dev libxml2-dev \
        libbz2-dev libcurl4-openssl-dev libjpeg-dev libpng12-dev libfreetype6-dev libkrb5-dev libpq-dev libxml2-dev libxslt1-dev libicu-dev

RUN mkdir -p /opt/php-7.1 \
    && mkdir /usr/local/src/php7-build \
    && cd /usr/local/src/php7-build \
    && wget http://us3.php.net/get/php-7.1.0.tar.gz/from/this/mirror -O php-7.1.0.tar.gz \
    && tar -xzf php-7.1.0.tar.gz \
    && ln -s /usr/lib/libc-client.a /usr/lib/x86_64-linux-gnu/libc-client.a

RUN cd /usr/local/src/php7-build/php-7.1.0 \
    && ./configure \
        --prefix=/opt/php-7.1 \
        --with-pdo-pgsql \
        --with-zlib-dir \
        --with-freetype-dir \
        --enable-mbstring \
        --with-libxml-dir=/usr \
        --enable-soap \
        --enable-calendar \
        --with-curl \
        --with-mcrypt \
        --with-zlib \
        --with-gd \
        --with-pgsql \
        --disable-rpath \
        --enable-inline-optimization \
        --with-bz2 \
        --with-zlib \
        --enable-sockets \
        --enable-sysvsem \
        --enable-sysvshm \
        --enable-pcntl \
        --enable-mbregex \
        --enable-exif \
        --enable-bcmath \
        --with-mhash \
        --enable-zip \
        --with-pcre-regex \
        --with-pdo-mysql \
        --with-mysqli \
        --with-mysql-sock=/var/run/mysqld/mysqld.sock \
        --with-jpeg-dir=/usr \
        --with-png-dir=/usr \
        --enable-gd-native-ttf \
        --with-openssl \
        --with-fpm-user=www-data \
        --with-fpm-group=www-data \
        --with-libdir=/lib/x86_64-linux-gnu \
        --enable-ftp \
        --with-imap \
        --with-imap-ssl \
        --with-kerberos \
        --with-gettext \
        --with-xmlrpc \
        --with-xsl \
        --enable-opcache \
        --enable-fpm \
        --enable-intl \
    && make \
    && make install

RUN chmod +x /opt/php-7.1/sbin/php-fpm \
    && cp /usr/local/src/php7-build/php-7.1.0/php.ini-production /opt/php-7.1/lib/php.ini \
    && cp /opt/php-7.1/etc/php-fpm.conf.default /opt/php-7.1/etc/php-fpm.conf \
    && cp /opt/php-7.1/etc/php-fpm.d/www.conf.default /opt/php-7.1/etc/php-fpm.d/www.conf

ADD ./etc/php/7.1/fpm/php.ini /etc/php/7.1/fpm/php.ini
ADD ./etc/php/7.1/fpm/php-fpm.conf /etc/php/7.1/fpm/php-fpm.conf
ADD ./etc/php/7.1/fpm/pool.d/www.conf /etc/php/7.1/fpm/pool.d/www.conf

EXPOSE 9000

CMD ["/opt/php-7.1/sbin/php-fpm"]
