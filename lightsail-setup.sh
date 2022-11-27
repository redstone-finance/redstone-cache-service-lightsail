#!/bin/bash

# fix interactive install
export DEBIAN_FRONTEND=noninteractive

# install latest version of docker the lazy way
curl -sSL https://get.docker.com | sh

# make it so you don't need to sudo to run docker commands
usermod -aG docker ubuntu

# install docker-compose
curl -L https://github.com/docker/compose/releases/download/1.24.1/docker-compose-$(uname -s)-$(uname -m) -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose

mkdir -p /srv
chown ubuntu -R /srv

# Clone git repo with docker-compose configuration
git clone https://github.com/redstone-finance/redstone-cache-service-lightsail
cd redstone-cache-service-lightsail

# Running docker-compose
docker compose up
