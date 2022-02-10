FROM docker.io/tiredofit/alpine:3.15
LABEL maintainer="Dave Conroy (github.com/tiredofit)"

### Disable Features From Base Image
ENV CONTAINER_ENABLE_MESSAGING=FALSE \
    IMAGE_NAME="tiredofit/rspamd" \
    IMAGE_REPO_URL="https://github.com/tiredofit/docker-rspamd/"

### Install Dependencies
RUN set -x && \
   apk update && \
   apk upgrade && \
   apk add -t .rspamd-build-deps \
               py3-pip \
               redis \
               && \
   apk add -t .rspamd-run-deps \
               openssl \
               python3 \
               rspamd \
               rspamd-client \
               rspamd-controller \
               rspamd-fuzzy \
               rspamd-proxy \
               rspamd-utils \
               rsyslog \
               && \
   \
   pip3 install \
               configparser \
               inotify \
               && \
   \
   mkdir /run/rspamd && \
   mkdir -p /assets/rspamd && \
   mv /etc/rspamd/maps.d /assets/rspamd/ && \
   mv /usr/bin/redis-cli /usr/sbin && \
   \
### Cleanup
   apk del .rspamd-build-deps && \
   rm -rf /etc/logrotate.d/* /var/cache/apk/* /usr/src/*

### Networking Configuration
EXPOSE 11333 11334 11335

### Add Files
ADD install /
