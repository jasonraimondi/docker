FROM nginx:latest

COPY ./nginx.conf /etc/nginx/nginx.conf
ADD ./conf.d/ /etc/nginx/conf.d


EXPOSE 80 443

WORKDIR /var/www/html

CMD ["nginx"]
