# github.com/tiredofit/docker-rspamd

[![GitHub release](https://img.shields.io/github/v/tag/tiredofit/docker-rspamd?style=flat-square)](https://github.com/tiredofit/docker-rspamd/releases/latest)
[![Build Status](https://img.shields.io/github/actions/workflow/status/tiredofit/docker-rspamd/main.yml?branch=main&style=flat-square)](https://github.com/tiredofit/docker-rspamd/actions)
[![Docker Stars](https://img.shields.io/docker/stars/tiredofit/rspamd.svg?style=flat-square&logo=docker)](https://hub.docker.com/r/tiredofit/rspamd/)
[![Docker Pulls](https://img.shields.io/docker/pulls/tiredofit/rspamd.svg?style=flat-square&logo=docker)](https://hub.docker.com/r/tiredofit/rspamd/)
[![Become a sponsor](https://img.shields.io/badge/sponsor-tiredofit-181717.svg?logo=github&style=flat-square)](https://github.com/sponsors/tiredofit)
[![Paypal Donate](https://img.shields.io/badge/donate-paypal-00457c.svg?logo=paypal&style=flat-square)](https://www.paypal.me/tiredofit)

## About

This will build a Docker Image for [RSPAMD](https://www.rspamd.com), A high performance filter.

## Maintainer

- [Dave Conroy](https://github.com/tiredofit/)

## Table of Contents

- [About](#about)
- [Maintainer](#maintainer)
- [Table of Contents](#table-of-contents)
- [Installation](#installation)
  - [Build from Source](#build-from-source)
  - [Prebuilt Images](#prebuilt-images)
    - [Multi Architecture](#multi-archictecture)
- [Configuration](#configuration)
  - [Quick Start](#quick-start)
  - [Persistent Storage](#persistent-storage)
  - [Environment Variables](#environment-variables)
    - [Base Images used](#base-images-used)
  - [Networking](#networking)
- [Maintenance](#maintenance)
  - [Shell Access](#shell-access)
- [Support](#support)
  - [Usage](#usage)
  - [Bugfixes](#bugfixes)
  - [Feature Requests](#feature-requests)
  - [Updates](#updates)
- [License](#license)
- [References](#references)


## Installation
### Build from Source
Clone this repository and build the image with `docker build -t (imagename) .`

### Prebuilt Images
Builds of the image are available on [Docker Hub](https://hub.docker.com/r/tiredofit/rspamd)

```bash
docker pull docker.io/tiredofit/rspamd:(imagetag)
```
Builds of the image are also available on the [Github Container Registry](https://github.com/tiredofit/docker-rspamd/pkgs/container/docker-rspamd) 
 
```
docker pull ghcr.io/tiredofit/docker-rspamd:(imagetag)
``` 

The following image tags are available along with their tagged release based on what's written in the [Changelog](CHANGELOG.md):

| Container OS | Tag       |
| ------------ | --------- |
| Alpine       | `:latest` |

#### Multi Architecture
Images are built primarily for `amd64` architecture, and may also include builds for `arm/v7`, `arm64` and others. These variants are all unsupported. Consider [sponsoring](https://github.com/sponsors/tiredofit) my work so that I can work with various hardware. To see if this image supports multiple architecures, type `docker manifest (image):(tag)`

## Configuration

### Quick Start

* The quickest way to get started is using [docker-compose](https://docs.docker.com/compose/). See the examples folder for a working [docker-compose.yml](examples/docker-compose.yml) that can be modified for development or production use.

* Set various [environment variables](#environment-variables) to understand the capabilities of this image.
* Map [persistent storage](#data-volumes) for access to configuration and data files for backup.

### Persistent Storage

The following directories are used for configuration and can be mapped for persistent storage.

| Directory | Description |
| --------- | ----------- |


* * *
### Environment Variables

#### Base Images used

This image relies on an [Alpine Linux](https://hub.docker.com/r/tiredofit/alpine) base image that relies on an [init system](https://github.com/just-containers/s6-overlay) for added capabilities. Outgoing SMTP capabilities are handlded via `msmtp`. Individual container performance monitoring is performed by [zabbix-agent](https://zabbix.org). Additional tools include: `bash`,`curl`,`less`,`logrotate`,`nano`.

Be sure to view the following repositories to understand all the customizable options:

| Image                                                  | Description                            |
| ------------------------------------------------------ | -------------------------------------- |
| [OS Base](https://github.com/tiredofit/docker-alpine/) | Customized Image based on Alpine Linux |

#### Rspamd Configuration

| Parameter                           | Description | Default                              |
| ----------------------------------- | ----------- | ------------------------------------ |
| `ANTIVIRUS_ACTION`                  |             | `reject`                             |
| `ANTIVIRUS_ATTACHMENTS_ONLY`        |             | `TRUE`                               |
| `ANTIVIRUS_LOG_CLEAN`               |             | `TRUE`                               |
| `ANTIVIRUS_MAX_SIZE`                |             |                                      |
| `ANTIVIRUS_TYPE`                    |             | `clamav`                             |
| `ARC_ALLOW_ENVFROM_EMPTY`           |             | `TRUE`                               |
| `ARC_ALLOW_HDRFROM_MISMATCH`        |             | `TRUE`                               |
| `ARC_ALLOW_HDRFROM_MULTIPLE`        |             | `FALSE`                              |
| `ARC_ALLOW_USERNAME_MISMATCH`       |             | `FALSE`                              |
| `ARC_AUTH_ONLY`                     |             | `TRUE`                               |
| `ARC_SIGN_INBOUND`                  |             | `TRUE`                               |
| `ARC_SIGN_LOCAL`                    |             | `FALSE`                              |
| `ARC_TRY_FALLBACK`                  |             | `TRUE`                               |
| `ARC_USE_DOMAIN`                    |             | `recipient`                          |
| `ARC_USE_ESLD`                      |             | `TRUE`                               |
| `BAYESIAN_AUTOLEARN`                |             | `TRUE`                               |
| `BAYESIAN_AUTOLEARN_CHECK_BALANCE`  |             | `TRUE`                               |
| `BAYESIAN_AUTOLEARN_HAM_THRESHOLD`  |             | `-0.5`                               |
| `BAYESIAN_AUTOLEARN_MIN_BALANCE`    |             | `0.9`                                |
| `BAYESIAN_AUTOLEARN_SPAM_THRESHOLD` |             | `6.0`                                |
| `BAYESIAN_EXPIRE`                   |             |                                      |
| `BAYESIAN_MIN_LEARNS`               |             |                                      |
| `BAYESIAN_NEW_SCHEMA`               |             | `TRUE`                               |
| `BAYESIAN_SIGNATURES`               |             | `TRUE`                               |
| `BAYESIAN_STORE_STOKENS`            |             | `TRUE`                               |
| `CLAMAV_HOST`                       |             | `clamav`                             |
| `CLAMAV_PORT`                       |             | `3310`                               |
| `CONFIG_PATH`                       |             | `/config/`                           |
| `CONTROLLER_COUNT`                  |             |                                      |
| `CONTROLLER_LISTEN_IP`              |             | `*v4`                                |
| `CONTROLLER_LISTEN_PORT`            |             | `11334`                              |
| `CONTROLLER_HOST`                   |             | `127.0.0.1`                          |
| `CONTROLLER_PORT`                   |             | `11334`                              |
| `CONTROLLER_PASS`                   |             | `admin`                              |
| `CONTROLLER_SECURE_IPS`             |             | `127.0.0.1,172.16.0.0/12`            |
| `DKIM_ALLOW_ENVFROM_EMPTY`          |             | `TRUE`                               |
| `DKIM_ALLOW_HDRFROM_MISMATCH`       |             | `FALSE`                              |
| `DKIM_ALLOW_HDRFROM_MULTIPLE`       |             | `FALSE`                              |
| `DKIM_ALLOW_USERNAME_MISMATCH`      |             | `FALSE`                              |
| `DKIM_SIGN_AUTH`                    |             | `TRUE`                               |
| `DKIM_KEY_SIZE`                     |             | `2048`                               |
| `DKIM_SIGN_LOCAL`                   |             | `TRUE`                               |
| `DKIM_TRY_FALLBACK`                 |             | `TRUE`                               |
| `DKIM_USE_ESLD`                     |             | `TRUE`                               |
| `DKIM_USE_DOMAIN`                   |             | `header`                             |
| `DKIM_SELECTOR`                     |             | `mail`                               |
| `DMARC_DOMAIN`                      |             | `example.com`                        |
| `DMARC_EMAIL`                       |             | `postmaster@example.com`             |
| `DMARC_ENABLE_REPORTING`            |             | `TRUE`                               |
| `DMARC_FROM_NAME`                   |             | `Mailserver`                         |
| `DMARC_ORG_NAME`                    |             | `Example Organization`               |
| `DMARC_SEND_REPORTS`                |             | `FALSE`                              |
| `DMARC_SMTP_HELO`                   |             | `rspamd`                             |
| `DMARC_SMTP_HOST`                   |             | `postfix-relay`                      |
| `DMARC_SMTP_PORT`                   |             | `25`                                 |
| `DMARC_SMTP_RETRIES`                |             | `2`                                  |
| `ENABLE_ANTIVIRUS`                  |             | `TRUE`                               |
| `ENABLE_ARC`                        |             | `TRUE`                               |
| `ENABLE_ASN`                        |             | `TRUE`                               |
| `ENABLE_CONTROLLER`                 |             | `TRUE`                               |
| `ENABLE_DKIM`                       |             | `TRUE`                               |
| `ENABLE_DMARC`                      |             | `TRUE`                               |
| `ENABLE_GREYLIST`                   |             | `FALSE`                              |
| `ENABLE_HISTORY`                    |             | `TRUE`                               |
| `ENABLE_MILTER`                     |             | `TRUE`                               |
| `ENABLE_MX_CHECK`                   |             | `TRUE`                               |
| `ENABLE_NEURAL`                     |             | `TRUE`                               |
| `ENABLE_OLETOOLS`                   |             | `TRUE`                               |
| `ENABLE_PHISHING_CHECK`             |             | `TRUE`                               |
| `ENABLE_RATELIMITING`               |             | `TRUE`                               |
| `ENABLE_REPUTATION`                 |             | `TRUE`                               |
| `ENABLE_SPAMTRAP`                   |             | `TRUE`                               |
| `ENABLE_SPF`                        |             | `TRUE`                               |
| `ENABLE_URL_REPUTATION`             |             | `TRUE`                               |
| `ENABLE_URL_TAGS`                   |             | `TRUE`                               |
| `HISTORY_COMPRESS`                  |             | `TRUE`                               |
| `HISTORY_ROWS_LIMIT`                |             | `200`                                |
| `HISTORY_SUBJECT_PRIVACY`           |             | `FALSE`                              |
| `LOCAL_IPS`                         |             | `127.0.0.0/8, 172.16.0.0/12`         |
| `LOG_CONSOLE_COLORIZE`              |             | `TRUE`                               |
| `LOG_FILE`                          |             | `rspamd.log`                         |
| `LOG_LEVEL`                         |             | `silent`                             |
| `LOG_LOCATION`                      |             | `/logs/`                             |
| `LOG_SEVERITY`                      |             | `TRUE`                               |
| `LOG_TYPE`                          |             | `FILE`                               |
| `LOG_URLS`                          |             | `FALSE`                              |
| `LOG_USEC`                          |             | `FALSE`                              |
| `MAP_WATCH_INTERVAL`                |             | `30s`                                |
| `METRICS_ADD_HEADER`                |             | `6`                                  |
| `METRICS_GREYLIST`                  |             | `4`                                  |
| `METRICS_REJECT`                    |             | `15`                                 |
| `METRICS_SPOOF_REPLYTO`             |             | `6.0`                                |
| `METRICS_REWRITE_SUBJECT`           |             | `12`                                 |
| `MILTER_EXTENDED_SPAM_HEADERS`      |             | `FALSE`                              |
| `MODE`                              |             | `AIO`                                |
| `MX_CHECK_EXPIRE`                   |             | `86400`                              |
| `MX_CHECK_TIMEOUT`                  |             | `8.0`                                |
| `NAMESERVER`                        |             | `127.0.0.1`                          |
| `NAMESERVER_TIMEOUT`                |             | `5s`                                 |
| `NEURAL_ANN_EXPIRE`                 |             | `2w`                                 |
| `NEURAL_LEARNING_RATE`              |             | `0.01`                               |
| `NEURAL_MAX_ITERATIONS`             |             | `25`                                 |
| `NEURAL_MAX_TRAIN`                  |             | `1k`                                 |
| `NEURAL_MAX_USAGES`                 |             | `60`                                 |
| `OLETOOLS_HOST`                     |             |  `rspamd-olefy`                      |
| `OLETOOLS_PORT`                     |             |  `1005`                              |
| `OLETOOLS_SCAN_MIME`                |             | `TRUE`                               |
| `OLETOOLS_BLOCK_ALL_MACROS`         |             | `FALSE`                              |
| `PHISHING_ENABLE_OPENPHISH`         |             | `TRUE`                               |
| `PHISHING_ENABLE_PHISHTANK`         |             | `TRUE`                               |
| `PHISHING_OPENPHISH_FEED`           |             | `https://www.openphish.com/feed.txt` |
| `PHISHING_OPENPHISH_PREMIUM`        |             | `FALSE`                              |
| `RATELIMIT_FROM_BURST`              |             | `50`                                 |
| `RATELIMIT_FROM_RATE`               |             | `1 / 1min`                           |
| `RATELIMIT_RCPT_BURST`              |             | `50`                                 |
| `RATELIMIT_RCPT_RATE`               |             | `1 / 1min`                           |
| `REDIS_DB`                          |             | `7`                                  |
| `REDIS_HOST`                        |             | `rspamd-redis`                       |
| `REDIS_PORT`                        |             | `6379`                               |
| `REDIS_TIMEOUT`                     |             | `3s`                                 |
| `REWRITE_SUBJECT`                   |             | `[SPAM] %s`                          |
| `RSPAMD_DATA_LOCATION`              |             | `/data/rspamd`                       |
| `SETUP_TYPE`                        |             | `AUTO`                               |
| `SPAMTRAP_ACTION`                   |             | `no action`                          |
| `SPAMTRAP_LEARN_FUZZY`              |             | `TRUE`                               |
| `SPAMTRAP_LEARN_SPAM`               |             | `TRUE`                               |
| `SPAMTRAP_SCORE`                    |             | `1.0`                                |
| `SKIP_CLAMAV_HOST_CHECK`            |             | `FALSE`                              |
| `SKIP_NAMESERVER_HOST_CHECK`        |             | `FALSE`                              |
| `SKIP_OLEFY_HOST_CHECK`             |             | `FALSE`                              |
| `SKIP_REDIS_HOST_CHECK`             |             | `FALSE`                              |
| `WHITELIST_ANTIVIRUS`               |             | `antivirus.wl`                       |
| `WORKER_FUZZY_LISTEN_IP`            |             | `*v4`                                |
| `WORKER_FUZZY_LISTEN_PORT`          |             | `11335`                              |
| `WORKER_FUZZY_ALLOW_UPDATE_IPS`     |             | `127.0.0.1`                          |
| `WORKER_FUZZY_COUNT`                |             |                                      |
| `WORKER_FUZZY_EXPIRE`               |             | `90d`                                |
| `WORKER_FUZZY_SYNC`                 |             | `1min`                               |
| `WORKER_LISTEN_IP`                  |             | `*v4`                                |
| `WORKER_LISTEN_PORT`                |             | `11333`                              |
| `WORKER_COUNT`                      |             | `1`                                  |
| `WORKER_TASK_TIMEOUT`               |             | `12s`                                |
| `WORKER_PROXY_LISTEN_IP`            |             | `*v4`                                |
| `WORKER_PROXY_LISTEN_PORT`          |             | `11332`                              |
| `WORKER_PROXY_SPAM_HEADER`          |             | `X-Spam-Status`                      |
| `WORKER_PROXY_TIMEOUT`              |             | `120s`                               |
| `WORKER_PROXY_REJECT_MESSAGE`       |             | `Spam message rejected`              |
| `WORKER_PROXY_COUNT`                |             | `1`                                  |
| `WORKER_PROXY_MAX_RETRY`            |             | `5`                                  |
| `WORKER_PROXY_REJECT_DISCARD`       |             | `FALSE`                              |
| `WORKER_PROXY_REJECT_QUARANTINE`    |             | `FALSE`                              |
| `DB_HOST`                           |             |                                      |
| `DB_PORT`                           |             |                                      |

#### Spamlearn configuration

| Parameter                           | Description | Default                      |
| ----------------------------------- | ----------- | ---------------------------- |
| `ENABLE_SPAMLEARN_INOTIFY`          |             | `TRUE`                       |
| `LOG_LEVEL_SPAMLEARN`               |             | `INFO`                       |
| `LOG_SPAMLEARN_LOCATION`            |             | `/logs/spamlearn/`           |
| `LOG_SPAMLEARN_FILE`                |             | `spamlearn.log`              |
| `LOG_SPAMLEARN_TYPE`                |             | `FILE`                       |
| `SPAMLEARN_CONFIG_FILE`             |             | `/etc/inotify/spamlearn.cfg` |
| `SPAMLEARN_DELETE_AFTER_PROCESSING` |             | `TRUE`                       |
| `SPAMLEARN_HAM_LOCATION`            |             | `/data/spamlearn/ham`        |
| `SPAMLEARN_SPAM_LOCATION`           |             | `/data/spamlearn/spam`       |
| `` | | `` |
| `` | | `` |

### Networking

| Port   | Description             |
| ------ | ----------------------- |
| `11333` | Rspamd Port            |
| `11334` | Rspamd Controller Port |

## Maintenance
### Shell Access

For debugging and maintenance purposes you may want access the containers shell.

```bash
docker exec -it (whatever your container name is) bash
```
## Support

These images were built to serve a specific need in a production environment and gradually have had more functionality added based on requests from the community.
### Usage
- The [Discussions board](../../discussions) is a great place for working with the community on tips and tricks of using this image.
- [Sponsor me](https://tiredofit.ca/sponsor) for personalized support
### Bugfixes
- Please, submit a [Bug Report](issues/new) if something isn't working as expected. I'll do my best to issue a fix in short order.

### Feature Requests
- Feel free to submit a feature request, however there is no guarantee that it will be added, or at what timeline.
- [Sponsor me](https://tiredofit.ca/sponsor) regarding development of features.

### Updates
- Best effort to track upstream changes, More priority if I am actively using the image in a production environment.
- [Sponsor me](https://tiredofit.ca/sponsor) for up to date releases.

## License
MIT. See [LICENSE](LICENSE) for more details.

## References

* <https://www.rspamd.org>
