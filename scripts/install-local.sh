#!/bin/bash

export WORKDIR=$1

if [ -z "${WORKDIR}" ]; then
  echo "Please provide the installation directory."
  echo "e.g. install-local.sh ./foobar"
  exit 1
fi

set -euo pipefail

source "$(dirname "${BASH_SOURCE[0]}")"/util.sh

setup_monitoring_stack "${WORKDIR}"

echo "Now run the following commands:"
echo
echo "cd ${WORKDIR}"
echo "docker-compose up -d"
