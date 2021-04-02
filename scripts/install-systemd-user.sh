#!/bin/bash

set -euo pipefail

source "$(dirname "${BASH_SOURCE[0]}")"/util.sh

readonly SYSTEMD_SERVICE_PATH=$HOME/.config/systemd/user/
export WORKDIR=$HOME/.nodemetrics

setup_monitoring_stack "${WORKDIR}"

# Generate the systemd service file
mkdir -p "${SYSTEMD_SERVICE_PATH}"

DOCKER_COMPOSE_PATH=$(which docker-compose)
export DOCKER_COMPOSE_PATH
envsubst '$WORKDIR $DOCKER_COMPOSE_PATH' < ./scripts/assets/node-monitor.service.envsubst > "${SYSTEMD_SERVICE_PATH}"/node-monitor.service

systemctl --user daemon-reload
systemctl --user enable --now node-monitor
