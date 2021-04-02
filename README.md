# Monitor your host

> **NOTE:** Read in detail the motivation behind this repository in [this blog](https://suraj.io/post/2021/03/node-monitor/).

Monitor you node using prometheus & node-exporter and visualise it using grafana. This repository has configurations for installing prometheus, node-exporter and grafana.

## Prerequisites

- Docker is installed and running.
- Docker-compose is installed and running.

## Installation

### Install as a user systemd service

If you wish to install this as a user systemd service then run the following command:

```
make install-user-systemd
```

### Install in a custom directory

If you wish to install the configs in a different directory then execute the following command:

```
make INSTALL_PATH=<path to the directory> install-locally
```
