#!/bin/bash
docker build . -t lscr.io/linuxserver/jackett:local
if [ $# -gt 0 ]; then
    sed -i "s/YOURHOST/$1/g" docker-compose.yml
fi
docker compose up -d jackett