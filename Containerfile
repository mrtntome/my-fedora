ARG SOURCE_IMAGE="base"
ARG SOURCE_SUFFIX="-main"
ARG SOURCE_TAG="40"

FROM ghcr.io/ublue-os/${SOURCE_IMAGE}${SOURCE_SUFFIX}:${SOURCE_TAG}

RUN mkdir -p /var/lib/alternatives && \
    ostree container commit

RUN rpm-ostree install go-task && \
    ostree container commit

RUN wget https://copr.fedorainfracloud.org/coprs/ryanabx/cosmic-epoch/repo/fedora-$(rpm -E %fedora)/ryanabx-cosmic-epoch-fedora-$(rpm -E %fedora).repo -O /etc/yum.repos.d/_copr_ryanabx-cosmic.repo && \
    rpm-ostree install cosmic-desktop && \
    ostree container commit

COPY build.sh /tmp/build.sh

RUN /tmp/build.sh && \
    ostree container commit
