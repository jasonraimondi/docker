#!/usr/bin/env bash

mkdir -p /opt/php-7.1
mkdir /usr/local/src/php7-build
cd /usr/local/src/php7-build
wget http://de1.php.net/get/php-7.1.0.tar.bz2/from/this/mirror -O php-7.1.0.tar.bz2
tar jxf php-7.1.0.tar.bz2

cd php-7.1.0/

./configure \
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
    --enable-fpm 
    