#!/bin/bash

cd /var/www/html

composer install --no-interaction --no-dev --optimize-autoloader >> /dev/stdout 2>&1

/usr/bin/supervisord -n -c /etc/supervisord.conf
