#!/bin/bash
set -eux
docker build -t verebuild .
container_id=$(docker create verebuild)
docker start "$container_id"
docker cp "${container_id}:/workspace/vere/bazel-bin/pkg/vere/urbit" .
echo "Copied urbit into current dir"
