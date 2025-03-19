FROM docker.io/library/ubuntu:22.04
SHELL ["/bin/bash", "-c"]

ENV DEBIAN_FRONTEND noninteractive
ARG cpu_arch=unknown
COPY docker/ubuntu2204_${cpu_arch}.sourcelist /etc/apt/sources.list

RUN apt update \
    && apt  install -y --no-install-recommends \
    build-essential git git-lfs cmake \
    libunwind-dev

RUN apt  install -y --no-install-recommends \
    wget libcurl4-openssl-dev autoconf automake libtool g++ pkg-config uuid-dev libncurses5-dev python3-dev python3-pip libeigen3-dev libtiff-dev libsqlite3-dev sqlite3

RUN python3 -m pip install protobuf==3.14.0

WORKDIR /cyberrt
