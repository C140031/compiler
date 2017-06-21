FROM php:fpm
MAINTAINER Tan Yeong How "yeonghowtan@gmail.com"

RUN apt-get update
RUN apt-get update && apt-get install -y rsync openssh-server libffi-dev libssl-dev python-dev python-pip
RUN pip install paramiko
