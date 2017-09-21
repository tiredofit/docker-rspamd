FROM registry.selfdesign.org/docker/alpine:edge
LABEL maintainer="Dave Conroy (dave at tiredofit dot ca)"

### Disable Features From Base Image
   ENV ENABLE_SMTP=false

### Install Dependencies
   RUN echo 'http://dl-cdn.alpinelinux.org/alpine/edge/testing' >> /etc/apk/repositories && \
       apk update && \
       apk add --no-cache \
               ca-certificates \
               rspamd \
               rspamd-controller \
               rsyslog && \

       mkdir /run/rspamd && \

### Cleanup
       rm -rf /var/cache/apk/* /usr/src/*


### Add Files
   ADD install /

### Networking Configuration
   EXPOSE 11333 11334
