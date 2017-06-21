FROM php:fpm
MAINTAINER Tan Yeong How "yeonghowtan@gmail.com"

RUN apt-get update
RUN apt-get install -y python python-pip libffi-dev python-dev
RUN pip install setuptools cffi paramiko
