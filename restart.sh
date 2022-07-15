#!/bin/bash

set -eu

BASEDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd $BASEDIR

docker network create \
  --driver=bridge \
  --attachable \
  --internal=false \
  traefik || true

docker-compose down
docker-compose up -d
docker-compose logs -f
