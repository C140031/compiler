FROM php:fpm
MAINTAINER Tan Yeong How "yeonghowtan@gmail.com"

RUN apt-get update
RUN apt-get install -y python python-pip build-essential libssl-dev libffi-dev python-dev
RUN pip install cryptography
RUN pip install paramiko
