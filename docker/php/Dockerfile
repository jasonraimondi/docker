FROM php:7.1-fpm

# ADD ./etc/php/fpm/php-fpm.d/ /usr/local/etc/php-fpm.d
# COPY ./etc/php/fpm/php.ini /usr/local/etc/php/php.ini

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/bin/ --filename=composer

WORKDIR /var/www/html
