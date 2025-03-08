## 1.7.33 2025-03-08 <dave at tiredofit dot ca>

   ### Added
      - Rspamd 3.11.1
      - tiredofit/alpine:7.10.29


## 1.7.32 2024-12-16 <dave at tiredofit dot ca>

   ### Added
      - Pin to tiredofit/alpine:3.21-7.10.27
      - RSpamd 3.11.0


## 1.7.31 2024-11-21 <dave at tiredofit dot ca>

   ### Added
      - Drop to tiredofit/alpine:3.20-7.10.20


## 1.7.30 2024-11-21 <dave at tiredofit dot ca>

   ### Added
      - Pin to tiredofit/alpine:3.20-7.10.22
      - Add custom_scripts support to execute bash scripts from /assets/custom-scripts on container startup


## 1.7.29 2024-10-21 <dave at tiredofit dot ca>

   ### Added
      - Rspamd 3.10.2


## 1.7.28 2024-10-16 <dave at tiredofit dot ca>

   ### Added
      - RSpamd 3.10.1


## 1.7.27 2024-09-30 <dave at tiredofit dot ca>

   ### Added
      - Pin to tiredofit/alpine:3.20-7.10.4

   ### Changed
      - Fix for dkim generation - Credit to gotos@github #16


## 1.7.26 2024-09-30 <dave at tiredofit dot ca>

   ### Added
      - RSpamd 3.10.0


## 1.7.25 2024-07-31 <dave at tiredofit dot ca>

   ### Added
      - RSpamd 3.9.1


## 1.7.24 2024-07-12 <dave at tiredofit dot ca>

   ### Changed
      - Switch to included fmt


## 1.7.23 2024-07-12 <dave at tiredofit dot ca>

   ### Added
      - Rspamd 3.9.0


## 1.7.22 2024-06-14 <waja@github>

   ### Added
      - Add defaults for OLETOOLS_PORT and OLETOOLS_HOST values since ENABLE_OLETOOLS=TRUE


## 1.7.21 2024-05-22 <dave at tiredofit dot ca>

   ### Added
      - Switch to tiredofit/alpine 3.20 base


## 1.7.20 2024-02-26 <dave at tiredofit dot ca>

   ### Added
      - RSpamD 3.8.4


## 1.7.19 2024-02-25 <dave at tiredofit dot ca>

   ### Added
      - Rspsamd 3.8.3


## 1.7.18 2024-02-20 <dave at tiredofit dot ca>

   ### Changed
      - RSpamD 3.8.2


## 1.7.17 2024-01-26 <dave at tiredofit dot ca>

   ### Added
      - Rspamd 3.8.1


## 1.7.16 2024-01-20 <dave at tiredofit dot ca>

   ### Added
      - Rspamd 3.8.0


## 1.7.15 2024-01-19 <lcx@github>

   ### Added
      - Add subject regex blacklist support


## 1.7.14 2024-01-08 <dave at tiredofit dot ca>

   ### Changed
      - Quote ARC selector


## 1.7.13 2024-01-08 <dave at tiredofit dot ca>

   ### Changed
      - Fix issue with header not being read when signing DKIM properly


## 1.7.12 2024-01-04 <dave at tiredofit dot ca>

   ### Changed
      - Enable Fasttext
      - Modify some rules back to default settings


## 1.7.11 2023-12-15 <dave at tiredofit dot ca>

   ### Added
      - RSpamD 3.7.5


## 1.7.10 2023-12-08 <dave at tiredofit dot ca>

   ### Changed
      - Break system packages with Python


## 1.7.9 2023-12-08 <dave at tiredofit dot ca>

   ### Added
      - Change base image to tiredofit/alpine:3.19


## 1.7.8 2023-11-14 <dave at tiredofit dot ca>

   ### Added
      - Rspamd 3.7.4


## 1.7.7 2023-10-27 <dave at tiredofit dot ca>

   ### Added
      - Rspamd 3.7.3


## 1.7.6 2023-10-26 <dave at tiredofit dot ca>

   ### Added
      - Rspamd 3.7.2


## 1.7.5 2023-10-10 <dave at tiredofit dot ca>

   ### Changed
      - Bugfix for 1.7.4 removing "Backwards" compatbility


## 1.7.4 2023-10-08 <dave at tiredofit dot ca>

   ### Added
      - RSPAMD 3.7.1


## 1.7.3 2023-09-14 <dave at tiredofit dot ca>

   ### Changed
      - Minimize image size and remove build directories


## 1.7.2 2023-08-03 <dave at tiredofit dot ca>

   ### Added
      - RspamD 3.6


## 1.7.1 2023-05-10 <dave at tiredofit dot ca>

   ### Added
      - Alpine 3.18 base


## 1.7.0 2023-04-26 <dave at tiredofit dot ca>

   ### Added
      - Add support for _FILE environment variables


## 1.6.2 2023-03-17 <dave at tiredofit dot ca>

   ### Added
      - RSPAMD 3.5


## 1.6.1 2023-01-18 <dave at tiredofit dot ca>

   ### Added
      - Add METRICS_SPOOF_REPLYTO environment variable


## 1.6.0 2022-12-28 <dave at tiredofit dot ca>

   ### Added
      - Rspamd 3.4

   ### Changed
      - Add xxhash as a dependency
      - Add zstd-libs as a dependency to solve strange symbol issues


## 1.5.1 2022-12-01 <dave at tiredofit dot ca>

   ### Changed
      - Rework Dockerfile


## 1.5.0 2022-11-23 <dave at tiredofit dot ca>

   ### Added
      - Alpine 3.17 base
      - Switch to OpenSSL 3.x instead of LibreSSl


## 1.4.1 2022-10-25 <dave at tiredofit dot ca>

   ### Added
      - Add additional packages to run dependencies


## 1.4.0 2022-10-25 <dave at tiredofit dot ca>

   ### Added
      - Switch to building RSPAMD from source

   ### Changed
      - Fix for inotify spam learning


## 1.3.21 2022-10-06 <dave at tiredofit dot ca>

This is an upgrade to RSPAMD 3.3 which if upgrading deserves review of https://rspamd.com/doc/migration.html#migration-to-rspamd-33 particularly the Redis cleanup required.

   ### Added
      - RSPAMD 3.3
      - Introduce SKIP_REDIS_HOST_CHECK, SKIP_NAMESERVER_HOST_CHECK, SKIP_CLAMAV_HOST_CHECK, SKIP_OLEFY_HOST_CHECK variables to stop checking for host avaiability before starting - All values `FALSE` by default


## 1.3.20 2022-08-11 <dave at tiredofit dot ca>

   ### Changed
      - Fix for logrotate issues


## 1.3.19 2022-07-26 <dave at tiredofit dot ca>

   ### Added
      - Refresh tiredofit/alpine:edge base image


## 1.3.18 2022-07-18 <dave at tiredofit dot ca>

   ### Added
      - Rebuild using latest tiredofit/alpine:edge


## 1.3.17 2022-07-18 <dave at tiredofit dot ca>

   ### Changed
      - Fix for Redis Pass not writing properly to configuration files


## 1.3.16 2022-06-27 <dave at tiredofit dot ca>

   ### Changed
      - Fix for antivirus module
      - Change Data lcoation to /data/data


## 1.3.15 2022-06-15 <dave at tiredofit dot ca>

   ### Changed
      - Cleanup some code including logging
      - Fix environment variables supporting overrides


## 1.3.14 2022-05-24 <dave at tiredofit dot ca>

   ### Added
      - RSpamD 3.2-r2


## 1.3.13 2022-04-26 <dave at tiredofit dot ca>

   ### Changed
      - Update logrotate directory


## 1.3.12 2022-04-05 <dave at tiredofit dot ca>

   ### Added
      - Rspamd 3.2


## 1.3.11 2022-02-09 <dave at tiredofit dot ca>

   ### Changed
      - Rework to support new base image


## 1.3.10 2022-02-09 <dave at tiredofit dot ca>

   ### Changed
      - Refresh base image


## 1.3.9 2022-01-17 <dave at tiredofit dot ca>

   ### Added
      - Add ENABLE_RATELIMITING (Default: TRUE) environment variable


## 1.3.8 2021-12-16 <dave at tiredofit dot ca>

   ### Changed
      - Tweak for Zabbix Autoregistration


## 1.3.7 2021-12-15 <dave at tiredofit dot ca>

   ### Changed
      - Switch to Alpine 3.15 as Edge was a bit too bleeding


## 1.3.6 2021-12-14 <veseahouba@github>

   ### Added
      - Option for ratelimit on incoming or outgoing messages

## 1.3.5 2021-12-07 <dave at tiredofit dot ca>

   ### Added
      - Add Zabbix Agent auto registration for templates


## 1.3.4 2021-10-24 <dave at tiredofit dot ca>

   ### Added
      - Add openssl to the run dependencies


## 1.3.3 2021-08-22 <morgenroth@github>

   ### Fixed
      - rspamd_options and url_tags configuration was not being written correctly and also disabling mx_checking.


## 1.3.1 2021-07-29 <dave at tiredofit dot ca>

   ### Changed
      - Bugfix for Redis DKIM files being inserted into Redis DB


## 1.3.0 2021-07-28 <dave at tiredofit dot ca>

   ### Changed
      - Massive bugfix release fixed groups, filters, DKIM


## 1.2.0 2021-05-10 <dave at tiredofit dot ca>

   ### Added
      - RSPAMD 2.7.0

## 1.1.0 2020-10-05 <dave at tiredofit dot ca>

   ### Added
      - Switch to Alpine Edge
      - Rspamd 2.6.0
      - Add IP Whitelist by domain option


## 1.0.8 2020-08-31 <dave at tiredofit dot ca>

   ### Changed
      - Fix broken Log Type configuration writing


## 1.0.7 2020-08-30 <dave at tiredofit dot ca>

   ### Added
      - Add MODE=AGENT for using spamlearn-inotify from remote system


## 1.0.6 2020-06-16 <dave at tiredofit dot ca>

   ### Changed
      - Fix Dockerfile Build


## 1.0.5 2020-06-12 <dave at tiredofit dot ca>

   ### Added
      - Refactor to support tiredofit/alpine base image changes


## 1.0.4 2020-06-07 <dave at tiredofit dot ca>

   ### Added
      - Add Controller Pass for Spam/HAM learning for inotify script


## 1.0.3 2020-06-06 <dave at tiredofit dot ca>

   ### Added
      - Add timestamps for inotify-spamlearn logging

   ### Reverted


## 1.0.2 2020-06-06 <dave at tiredofit dot ca>

   ### Added
      - Alpine 3.12 Base


## 1.0.1 2020-06-05 <dave at tiredofit dot ca>

   ### Changed
      - Move /etc/s6/services to /etc/services.d


## 1.0.0 2020-05-19 <dave at tiredofit dot ca>

   ### Added
      - Reworked Entire Image
      - Dyanmic Loading
      - SPamlearn Inotify Script Installed


## 0.2 2017-09-20 Dave Conroy <dave at tiredofit dot ca>

* Working release
* Enable Milter and Antivirus

## 0.1 2017-09-12 Dave Conroy <dave at tiredofit dot ca>

* Initial _not working_ release

