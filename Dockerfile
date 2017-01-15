FROM buildpack-deps:xenial

RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    devscripts \
    cdbs \
    gengetopt \
    libjson0-dev \
    quilt \
    debhelper \
    dh-buildinfo \
    config-package-dev php7.0-cli \
    nodejs npm nodejs-legacy \
    lsb-release \    
    composer \
    && rm -rf /var/lib/apt/lists/*
RUN npm install -g bower
