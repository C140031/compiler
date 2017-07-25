FROM php:fpm
MAINTAINER Tan Yeong How "yeonghowtan@gmail.com"

RUN apt-get update
RUN apt-get update && apt-get install -y libffi-dev libssl-dev python-dev python-pip pypy python-pypy.sandbox

RUN \
    ln -s /usr/lib/python2.7/dist-packages/pypy/ /usr/lib/pypy/dist-packages/ && \
    pypy --version && \
    ln -s /usr/lib/pypy-sandbox/x86_64-linux-gnu/pypy-c-sandbox /usr/lib/pypy-sandbox/pypy-c-sandbox

USER www-data

# Install Java.
RUN \
  echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | debconf-set-selections && \
  add-apt-repository -y ppa:webupd8team/java && \
  apt-get update && \
  apt-get install -y oracle-java8-installer && \
  sudo rm -rf /var/lib/apt/lists/* && \
  sudo rm -rf /var/cache/oracle-jdk8-installer


# Define commonly used JAVA_HOME variable
ENV JAVA_HOME /usr/lib/jvm/java-8-oracle

