FROM buildpack-deps:jessie

RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    devscripts \
    cdbs \
    gengetopt \
    && rm -rf /var/lib/apt/lists/*
