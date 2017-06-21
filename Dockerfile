FROM php:fpm
MAINTAINER Tan Yeong How "yeonghowtan@gmail.com"

RUN apt-get update
RUN apt-get update && apt-get install -y rsync openssh-server libffi-dev libssl-dev python-dev
RUN pip install paramiko web.py docker-py==1.7.1 raven contextlib2
