#!/bin/bash

set -euo pipefail

function setup_monitoring_stack() {
  monitoring_data_dir=$1

  if [ -z "${monitoring_data_dir}" ]; then
    echo "data dir not provided"
    exit 1
  fi

  mkdir -p "${monitoring_data_dir}"/{data,grafana}

  # Generate the Prometheus config file.
  NODE_EXPORTER_TARGET=$(ip a sh docker0 | grep -Po 'inet \K[\d\.]+')
  export NODE_EXPORTER_TARGET
  envsubst '$NODE_EXPORTER_TARGET' < ./scripts/assets/prometheus.yaml.envsubst > "${monitoring_data_dir}"/prometheus.yaml

  # Generate the datasource for Grafana
  envsubst '$NODE_EXPORTER_TARGET' < scripts/assets/datasource.yaml.envsubst > "${monitoring_data_dir}"/datasource.yaml

  # Copy the docker-compose file
  cp ./scripts/assets/docker-compose.yaml "${monitoring_data_dir}"

  # Install the dashboard
  curl -sL -o "${monitoring_data_dir}"/node-exporter.json https://grafana.com/api/dashboards/1860/revisions/22/download
  cp ./scripts/assets/dashboard-definition.yaml "${monitoring_data_dir}"
}
