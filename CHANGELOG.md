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

