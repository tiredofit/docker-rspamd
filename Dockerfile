ARG DISTRO="alpine"
ARG DISTRO_VARIANT="3.19"

FROM docker.io/tiredofit/${DISTRO}:${DISTRO_VARIANT}
LABEL maintainer="Dave Conroy (github.com/tiredofit)"

ARG RSPAMD_VERSION

ENV RSPAMD_VERSION=${RSPAMD_VERSION:-"3.7.4"} \
    RSPAMD_REPO_URL=https://github.com/rspamd/rspamd \
    CONTAINER_ENABLE_MESSAGING=FALSE \
    IMAGE_NAME="tiredofit/rspamd" \
    IMAGE_REPO_URL="https://github.com/tiredofit/docker-rspamd/"

### Install Dependencies
RUN source /assets/functions/00-container && \
    set -x && \
    addgroup -S -g 11333 rspamd && \
    adduser -S -D -H -h /dev/null -s /sbin/nologin -G rspamd -u 11333 rspamd && \
    package update && \
    package upgrade && \
    package install .rspamd-build-deps \
                build-base \
                cmake \
                curl-dev \
#                fasttext-dev \ ## TODO
                fmt-dev \
                git \
                glib-dev \
                icu-dev \
                libsodium-dev \
                libstemmer-dev \
                luajit-dev \
                openssl-dev \
                pcre2-dev \
                perl \
                py3-pip \
                ragel \
                redis \
                samurai \
                sqlite-dev \
                vectorscan-dev \
                xxhash-dev \
                zlib-dev \
                zstd-dev \
                && \
    \
    package install .rspamd-run-deps \
                fmt \
                glib \
                icu \
                icu-data-full \
                libestr \
                libfastjson \
                libsodium \
                libstemmer \
                libuuid \
                luajit \
                pcre2 \
                openssl \
                python3 \
                rsyslog \
                sqlite \
                vectorscan \
                xxhash \
                zlib \
                zstd \
                zstd-libs \
                && \
    \
    pip3 install \
                configparser \
                inotify \
                && \
    \
    clone_git_repo "${RSPAMD_REPO_URL}" "${RSPAMD_VERSION}" && \
    cmake \
        -B build \
        -G Ninja \
        -DCMAKE_BUILD_TYPE=MinSizeRel \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCONFDIR=/etc/rspamd \
        -DRUNDIR=/run/rspamd \
        -DRSPAMD_USER=rspamd \
        -DRSPAMD_GROUP=rspamd \
        #-DENABLE_FASTTEXT=ON \ ## TODO
        -DENABLE_BACKWARD=OFF \
        -DENABLE_PCRE2=ON \
        -DENABLE_HYPERSCAN=ON \
        -DENABLE_LUAJIT=ON \
        -DENABLE_URL_INCLUDE=ON \
        -DSYSTEM_FMT=ON \
        -DSYSTEM_XXHASH=ON \
        -DSYSTEM_ZSTD=ON \
        -DCMAKE_HOST_SYSTEM_NAME=Linux \
        . \
        && \
    cmake --build build --target all && \
    cmake --build build --target install && \
    mkdir -p /run/rspamd && \
    mkdir -p /assets/rspamd && \
    mkdir -p /etc/rspamd/local.d && \
    mkdir -p /etc/rspamd/override.d && \
    mv /etc/rspamd/maps.d /assets/rspamd/ && \
    mv /usr/bin/redis-cli /usr/sbin && \
    \
    package remove .rspamd-build-deps && \
    package cleanup && \
    rm -rf /etc/logrotate.d/* \
           /usr/src/* \
           /var/cache/package/*

EXPOSE 11333 11334 11335

COPY install /
