#!/usr/bin/env bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

cd $DIR/nginx
docker build -t jasonraimondi/nginx:$1 -t jasonraimondi/nginx:latest .
docker push jasonraimondi/nginx:$1
docker push jasonraimondi/nginx:latest

cd $DIR/php
docker build -t jasonraimondi/php:$1 -t jasonraimondi/php:latest .
docker push jasonraimondi/php:$1
docker push jasonraimondi/php:latest

# cd $DIR/mailcatcher
# docker build -t jasonraimondi/mailcatcher:$1 -t jasonraimondi/mailcatcher:latest .
# docker push jasonraimondi/mailcatcher:$1
# docker push jasonraimondi/mailcatcher:latest