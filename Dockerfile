FROM php:fpm
MAINTAINER Tan Yeong How "yeonghowtan@gmail.com"

RUN apt-get update
RUN apt-get update && apt-get install -y libffi-dev libssl-dev python-dev python-pip python-paramiko

RUN useradd -G www-data ec2-user

RUN chown -R www-data:www-data /var/www/html
RUN chmod -R 774 /var/www/html
RUN ls -ld /var/www/html

RUN find /var/www/html -type d -exec chmod g+s {} +
RUN ls -ld /var/www/html
