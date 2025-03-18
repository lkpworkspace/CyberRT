#!/bin/bash
readonly PWD0="$(dirname "$(readlink -fn "$0")")"
readonly PROJ_ROOT="$(dirname ${PWD0})"

version=1.0.0

cpu_arch="$(uname -m)"
docker run -it --rm \
    -v "$PROJ_ROOT":/cyberrt \
    cyberrt-dev:"$cpu_arch-$version"

