FROM ubuntu:20.04
MAINTAINER Daniel Landau <dockerhub@landau.fi>

ENV DEBIAN_FRONTEND=noninteractive

ENV GMAT_VERSION R2020a
ENV GMAT_SHA1 de9a17bd4fdb5cd1ed1e7b38fac84a9e5d2c52cf

RUN set -eux; \
    apt-get update; \
    apt-get upgrade; \
    apt-get install -y curl

RUN set -eux; \
    curl https://downloads.sourceforge.net/project/gmat/GMAT/GMAT-${GMAT_VERSION}/gmat-ubuntu-x64-${GMAT_VERSION}.tar.gz?use_mirror=autoselect -L -o gmat.tar.gz ; \
    echo "${GMAT_SHA1} gmat.tar.gz" > sha_verification ; \
    sha1sum -c sha_verification ; \
    tar xf gmat.tar.gz

ENV PATH "/GMAT/${GMAT_VERSION}/bin:$PATH"
