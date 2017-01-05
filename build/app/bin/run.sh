#!/bin/bash

cd /var/www/API2

composer install --no-interaction --no-dev --optimize-autoloader >> /dev/stdout 2>&1

until nc -z mysql 3306; do
    echo "$(date) - waiting for mysql..."
    sleep 1
done

/usr/bin/supervisord -n -c /etc/supervisord.conf
