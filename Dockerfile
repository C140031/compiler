FROM php:fpm
MAINTAINER Tan Yeong How "yeonghowtan@gmail.com"

RUN apt-get update
RUN apt-get update && apt-get install -y libffi-dev libssl-dev python-dev python-pip python-paramiko

RUN find /var/www/html/ -type d -exec chmod 755 {} \; 
RUN find /var/www/html/ -type f -exec chmod 644 {} \;
