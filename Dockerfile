FROM php:fpm
MAINTAINER Tan Yeong How "yeonghowtan@gmail.com"

RUN apt-get update
RUN apt-get update && apt-get install -y libffi-dev libssl-dev python-dev python-pip

ENV PYPY_VERSION 5.8.0
ENV PYPY_SHA256SUM 9d090127335c3c0fd2b14c8835bf91752e62756e55ea06aad3353f24a6854223

RUN set -ex; \
	\
	fetchDeps=' \
		bzip2 \
		wget \
	'; \
	apt-get update && apt-get install -y $fetchDeps --no-install-recommends && rm -rf /var/lib/apt/lists/*; \
	\
	wget -O pypy.tar.bz2 "https://bitbucket.org/pypy/pypy/downloads/pypy3-v5.8.0-src.tar.bz2"; \
	echo "$PYPY_SHA256SUM *pypy.tar.bz2" | sha256sum -c; \
	tar -xjC /usr/local --strip-components=1 -f pypy.tar.bz2; \
	rm pypy.tar.bz2
