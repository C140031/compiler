FROM php:fpm
MAINTAINER Tan Yeong How "yeonghowtan@gmail.com"

RUN apt-get update
RUN apt-get update && apt-get install -y libffi-dev libssl-dev python-dev python-pip pypy python-pypy.sandbox

RUN \
    ln -s /usr/lib/python2.7/dist-packages/pypy/ /usr/lib/pypy/dist-packages/ && \
    pypy --version && \
    ln -s /usr/lib/pypy-sandbox/x86_64-linux-gnu/pypy-c-sandbox /usr/lib/pypy-sandbox/pypy-c-sandbox

USER www-data

RUN apt-get update && apt-get install -y unzip && rm -rf /var/lib/apt/lists/*

# Default to UTF-8 file.encoding
ENV LANG C.UTF-8

ENV JAVA_VERSION 8u45
ENV JAVA_DEBIAN_VERSION 8u45-b14-1

# see https://bugs.debian.org/775775
# and https://github.com/docker-library/java/issues/19#issuecomment-70546872
ENV CA_CERTIFICATES_JAVA_VERSION 20140324

RUN apt-get update && apt-get install -y openjdk-8-jdk="$JAVA_DEBIAN_VERSION" ca-certificates-java="$CA_CERTIFICATES_JAVA_VERSION" && sudo rm -rf /var/lib/apt/lists/*

# see CA_CERTIFICATES_JAVA_VERSION notes above
RUN /var/lib/dpkg/info/ca-certificates-java.postinst configure

