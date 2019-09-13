#!/usr/bin/env bash

# WORKAROUND: https://github.com/docker-library/elasticsearch/issues/111
sudo sysctl -w vm.max_map_count=262144  # otherwise ELK fails to start

docker-compose -f docker/docker-compose.yml up
