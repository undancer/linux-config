#!/bin/bash

docker run -t --rm --privileged \
  --env EARTHLY_BUILD_ARGS \
  -v /var/run/docker.sock:/var/run/docker.sock \
  -v "$(pwd)":/workspace \
  -v earthly-tmp:/tmp/earthly:rw \
  earthly/earthly:v0.7.4 --allow-privileged "$@"
