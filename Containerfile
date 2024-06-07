ARG SOURCE_IMAGE="base"
ARG SOURCE_SUFFIX="-main"
ARG SOURCE_TAG="40"

FROM ghcr.io/ublue-os/${SOURCE_IMAGE}${SOURCE_SUFFIX}:${SOURCE_TAG}

COPY build.sh /tmp/build.sh

RUN mkdir -p /var/lib/alternatives && \
    /tmp/build.sh && \
    ostree container commit
