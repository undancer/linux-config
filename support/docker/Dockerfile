ARG image=library/ubuntu:lunar
ARG tag=2023.02

FROM library/alpine AS base
ARG tag

RUN set -x \
    && apk update \
    && apk add \
    curl \ 
    tar \
    && mkdir -p /buildroot

RUN curl -s -L https://github.com/buildroot/buildroot/archive/refs/tags/$tag.tar.gz | tar xz -C ./buildroot --strip-components=1

FROM $image

COPY --from=base --chown=br-user:br-user ./buildroot /buildroot

# RUN cd /buildroot \
#     && make distclean \
#     && make alldefconfig \
#     && make toolchain