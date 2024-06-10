ARG SOURCE_IMAGE="base"
ARG SOURCE_SUFFIX="-main"
ARG SOURCE_TAG="40"

FROM ghcr.io/ublue-os/${SOURCE_IMAGE}${SOURCE_SUFFIX}:${SOURCE_TAG}

RUN mkdir -p /var/lib/alternatives && \
    ostree container commit

RUN rpm-ostree install go-task && \
    ostree container commit

COPY build.sh /tmp/build.sh

RUN /tmp/build.sh && \
    ostree container commit
