#!/usr/bin/env bash
readonly PWD0="$(dirname "$(readlink -fn "$0")")"
readonly PROJ_ROOT="$(dirname ${PWD0})"
readonly IMAGE_NAME="cyberrt"

set -e

function main {
  cd "${PWD0}"

  local -a cmd=()
  if command -v docker; then
    cmd+=("docker" "build")
  else
    echo "No docker existed!"
    exit 1
  fi

  local cpu_arch="$(uname -m)"
  local tag="${cpu_arch}-$1"
  "${cmd[@]}" \
    --build-arg cpu_arch=${cpu_arch} \
    --ulimit nofile=102400:102400 \
    -f "$2.dockerfile" \
    -t "${IMAGE_NAME}-$2:${tag}" \
    "${PROJ_ROOT}"
}

if [ "$#" -ne 2 ]; then
    echo "Error: No arguments provided. Usage: $0 \"proj_version\" \"[ dev | runtime ]\""
    exit 1
fi

main "$@"
