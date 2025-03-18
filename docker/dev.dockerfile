FROM docker.io/library/ubuntu:22.04
SHELL ["/bin/bash", "-c"]

ENV DEBIAN_FRONTEND noninteractive
ARG cpu_arch=unknown
COPY docker/ubuntu2204_${cpu_arch}.sourcelist /etc/apt/sources.list
RUN yes | unminimize
RUN apt update \
    && apt  install -y --no-install-recommends \
    build-essential git git-lfs cmake \
    libunwind-dev

WORKDIR /cyberrt
