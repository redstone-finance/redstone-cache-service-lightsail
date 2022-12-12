#!/bin/bash

# To display commands
set -x

# Fix interactive install
export DEBIAN_FRONTEND=noninteractive

# Install latest version of docker the lazy way
curl -sSL https://get.docker.com | sh

# Make it so you don't need to sudo to run docker commands
usermod -aG docker ubuntu

# Install docker compose
curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose

# Clone git repo with docker-compose configuration
git clone https://github.com/redstone-finance/redstone-cache-service-lightsail
cd redstone-cache-service-lightsail

# Redirect port 80 to 3000
sudo iptables -t nat -A PREROUTING -i eth0 -p tcp --dport 80 -j REDIRECT --to-port 3000

# Add redirect command to bootup: https://stackoverflow.com/a/16573737
echo iptables -t nat -A PREROUTING -i eth0 -p tcp --dport 80 -j REDIRECT --to-port 3000 >> /etc/rc.local

# Running docker-compose (in detached mode)
docker-compose up -d
