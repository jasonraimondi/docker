FROM node:6.9-alpine

MAINTAINER Jason Raimondi <jason@raimondi.us>

RUN apk update \
    && apk add curl bash supervisor gpg \
    && curl -o- -L https://yarnpkg.com/install.sh | bash
    # && apk clean \
    # && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* \
    # && rm -rf /var/www/html

ADD supervisord.conf /etc/supervisord.conf

CMD ["/usr/bin/supervisord", "-n -c /etc/supervisord.conf"]
