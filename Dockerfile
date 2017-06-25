FROM php:fpm
MAINTAINER Tan Yeong How "yeonghowtan@gmail.com"

RUN apt-get update
RUN apt-get update && apt-get install -y libffi-dev libssl-dev python-dev python-pip pypy python-pypy.sandbox

RUN ls /usr/lib && \
    ls /usr/lib/python2.7/dist-packages/pypy/ && \
    ln -s /usr/lib/python2.7/dist-packages/pypy/ /usr/lib/pypy/dist-packages/

USER www-data
