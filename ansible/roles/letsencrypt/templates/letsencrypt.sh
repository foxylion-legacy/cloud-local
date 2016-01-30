#!/bin/bash
set -e

docker run -it --rm \
       -v "/cloud/letsencrypt/config:/etc/letsencrypt" \
       -v "/cloud/letsencrypt/data:/var/lib/letsencrypt" \
       -v "/cloud/letsencrypt/www:/cloud/letsencrypt/www" \
       -v "/var/log/letsencrypt:/var/log/letsencrypt" \
       quay.io/letsencrypt/letsencrypt:latest auth

# Link the new certificate
rm -rf /cloud/letsencrypt/config/current
mkdir -p /cloud/letsencrypt/config/current
ln -s /cloud/letsencrypt/config/live/{{ public_domains|first }}/fullchain.pem /cloud/letsencrypt/config/current/fullchain.pem
ln -s /cloud/letsencrypt/config/live/{{ public_domains|first }}/privkey.pem   /cloud/letsencrypt/config/current/privkey.pem

# Restart the nginx to activate the new certificate
docker restart lc-nginx
