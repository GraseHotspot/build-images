FROM buildpack-deps:trusty

RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    devscripts \
    cdbs \
    && rm -rf /var/lib/apt/lists/*
