FROM buildpack-deps:bionic

ENV BUMPBUILD=201908022053
ENV    DEBIAN_FRONTEND noninteractive

RUN apt-get update && apt-get install -y --no-install-recommends \
    gpg software-properties-common \
    && add-apt-repository -y ppa:ondrej/php \
    && rm -rf /var/lib/apt/lists/*

# Add ndoesource 8
RUN curl -sSL https://deb.nodesource.com/gpgkey/nodesource.gpg.key | apt-key add -
RUN VERSION=node_8.x; DISTRO="$(lsb_release -s -c)"; \
    echo "deb https://deb.nodesource.com/$VERSION $DISTRO main" | tee /etc/apt/sources.list.d/nodesource.list


RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    devscripts \
    cdbs \
    gengetopt \
    libjson-c-dev \
    quilt \
    debhelper \
    dh-buildinfo \
    config-package-dev php5.6-cli php5.6-mysql php5.6-xml \
    nodejs \
    lsb-release \
    composer \
    && rm -rf /var/lib/apt/lists/*
RUN npm install -g bower

RUN dpkg --add-architecture armhf; dpkg --add-architecture i386
RUN sed -i 's/deb http/deb [arch=amd64,i386] http/' /etc/apt/sources.list
RUN echo 'deb [arch=armhf] http://ports.ubuntu.com/ bionic main universe restricted' >> /etc/apt/sources.list
RUN echo 'deb [arch=armhf] http://ports.ubuntu.com/ bionic-updates main universe restricted' >> /etc/apt/sources.list
RUN ln -s /usr/bin/strip /usr/bin/i686-linux-gnu-strip

RUN apt-get update
RUN apt-get -y install crossbuild-essential-armhf \
  crossbuild-essential-armel git debhelper libc6-dev gengetopt libtool automake \
  libssl-dev libjson-c-dev libssl-dev:armhf libjson-c-dev:armhf \
   libssl-dev:i386 libjson-c-dev:i386 \
  && rm -rf /var/lib/apt/lists/*
