FROM php:fpm
MAINTAINER Tan Yeong How "yeonghowtan@gmail.com"

RUN apt-get update
RUN apt-get update && apt-get install -y libffi-dev libssl-dev python-dev python-pip
RUN pip install wget

RUN curl https://bitbucket.org/pypy/pypy/downloads/pypy3-v5.8.0-src.tar.bz2 \
  | tar -xjC /tmp/package \
  && make -C /tmp/package
  

