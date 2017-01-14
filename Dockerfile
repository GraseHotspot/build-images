FROM buildpack-deps:trusty

RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    devscripts \
    cdbs \
    gengetopt \
    libjson0-dev \
    quilt \
    debhelper \
    nodejs npm nodejs-legacy \
    config-package-dev php5-cli \
    && rm -rf /var/lib/apt/lists/*
RUN npm install -g bower
COPY install_composer.sh ./
RUN ./install_composer.sh
