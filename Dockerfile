FROM tiredofit/alpine:edge
LABEL maintainer="Dave Conroy (dave at tiredofit dot ca)"

### Disable Features From Base Image
ENV ENABLE_SMTP=false

### Install Dependencies
RUN set -x && \
   apk update && \
   apk upgrade && \
   apk add -t .rspam-build-deps \
               py3-pip \
               && \
   apk add -t .rspam-run-deps \
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
   mkdir -p /assts/rspamd && \
   mv /etc/rspamd/maps.d /assets/rspamd/ && \
   \
### Cleanup
   apk del .rspam-build-deps && \
   rm -rf /etc/logrotate.d /var/cache/apk/* /usr/src/*

### Networking Configuration
EXPOSE 11333 11334 11335

### Add Files
ADD install /
