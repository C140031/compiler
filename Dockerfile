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
	cd /opt; \
	wget "https://bitbucket.org/pypy/pypy/downloads/pypy3-v5.8.0-src.tar.bz2" -O pypy3-v5.8.0-src.tar.bz2; \
        echo "$PYPY_SHA256SUM *pypy3-v5.8.0-src.tar.bz2" | sha256sum -c; \
        tar -xf pypy3-v5.8.0-src.tar.bz2; \
        ln -s /opt/pypy3-v5.8.0-src/bin/pypy /usr/local/bin; \
        pypy --version; \
        rm pypy3-v5.8.0-src.tar.bz2
    
RUN cd /opt/pypy3-v5.8.0-src/bin/pypy && -m ensurepip
RUN cd /opt/pypy3-v5.8.0-src/bin/pip install -U pip wheel
