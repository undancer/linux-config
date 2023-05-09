VERSION 0.7

# FROM library/alpine
FROM library/ubuntu:lunar

ARG --global VARIANT=core # core, lite, framework
ARG --global FLAVOR=ubuntu
ARG --global BASE_URL=docker.io/undancer
ARG --global IMAGE=${BASE_URL}/${VARIANT}-${FLAVOR}:latest

ARG --global LUET_VERSION=0.34.0


luet:
  FROM quay.io/luet/base:$LUET_VERSION
  SAVE ARTIFACT /usr/bin/luet /luet

run:
  FROM earthly/dind:${FLAVOR}
  COPY +luet/luet /usr/bin/luet
  WORKDIR /packages
  COPY ./packages /packages
  RUN luet --help
  WITH DOCKER
    RUN values="${FLAVOR}-$(uname -m)" \
        # && target="system/kernel" \
        # && target="system/initramfs" \
        && target="system/os" \
        && luet build --values ./values/${values}.yaml \
        ${target}
  END
  SAVE ARTIFACT ./build/* AS LOCAL ./dist/
