FROM buildpack-deps:trusty

RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    devscripts \
    cdbs \
    gengetopt \
    libjson0-dev \
    quilt \
    debhelper \
    nodejs npm \
    && rm -rf /var/lib/apt/lists/*
RUN npm install -g bower

