FROM buildpack-deps:trusty

ENV BUMPBUILD=201807082225

RUN echo deb http://security.ubuntu.com/ubuntu trusty-security main restricted  >> /etc/apt/sources.list && \
echo deb http://security.ubuntu.com/ubuntu trusty-security universe >> /etc/apt/sources.list && \
echo deb http://security.ubuntu.com/ubuntu trusty-security multiverse >> /etc/apt/sources.list

RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    devscripts \
    cdbs \
    gengetopt \
    libjson0-dev \
    quilt \
    debhelper \
    dh-buildinfo \
    nodejs npm nodejs-legacy \
    config-package-dev php5-cli \
    lsb-release \
    ca-certificates \
    && rm -rf /var/lib/apt/lists/*
RUN npm set strict-ssl false && npm install -g bower
COPY install_composer.sh ./
RUN ./install_composer.sh
