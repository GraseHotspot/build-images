FROM buildpack-deps:jessie

RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    devscripts \
    cdbs \
    gengetopt \
    libjson0-dev \
    quilt \
    debhelper \
    config-package-dev \
    libparse-debcontrol-perl \
    nodejs npm \
    && rm -rf /var/lib/apt/lists/*
RUN npm install -g bower

RUN echo 'deb http://emdebian.org/tools/debian/ jessie main' > /etc/apt/sources.list.d/crosstools.list; curl http://emdebian.org/tools/debian/emdebian-toolchain-archive.key | apt-key add -
RUN dpkg --add-architecture armhf; dpkg --add-architecture armel; dpkg --add-architecture i386;apt-get update
RUN apt-get -y install crossbuild-essential-armhf crossbuild-essential-armel binutils-i586-linux-gnu
RUN apt-get -y install git debhelper libc6-dev gengetopt libtool automake libssl-dev libjson0-dev
RUN apt-get -y install libssl-dev:armhf libjson0-dev:armhf
RUN apt-get -y install libssl-dev:armel libjson0-dev:armel
RUN apt-get -y install libssl-dev:i386 libjson0-dev:i386
