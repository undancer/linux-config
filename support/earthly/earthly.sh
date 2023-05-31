#!/usr/bin/env bash
set -x -v

docker run -t --rm --privileged \
  --env EARTHLY_BUILD_ARGS \
  -e EARTHLY_TOKEN=WrVYcaLzZjfnrykF94VDYSE7ACteDlKma7KjfJbTZj0I9kUXzmWjVkHC5nu0KvJy \
  -v /var/run/docker.sock:/var/run/docker.sock \
  -v "$(pwd)":/workspace \
  -v earthly-tmp:/tmp/earthly:rw \
  earthly/earthly:v0.7.6 --allow-privileged "$@"
