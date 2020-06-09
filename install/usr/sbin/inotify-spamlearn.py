#!/usr/bin/env python3
# -*- coding: utf-8 -*-
# vim: ai ts=4 sts=4 et sw=4

import configparser
import logging
import os
import subprocess
import threading

import inotify.adapters



def getconfig():
    config = configparser.ConfigParser()
    try:
        config.read('<CONFIG_FILE>')
        spam_dir = config.get('paths', 'spam_dir')
        ham_dir = config.get('paths', 'ham_dir')
        spamcmd = config.get('spam', 'spamcmd')
        hamcmd = config.get('spam', 'hamcmd')
        delete = config.getboolean('mode', 'delete')
        scan = config.getboolean('mode', 'scan')
        oneshot = config.getboolean('mode', 'oneshot')
        loglevel = config.get('logging', 'loglevel')
        logfile = config.get('logging', 'logfile')
        return spam_dir, ham_dir, spamcmd, hamcmd, logfile, loglevel, delete, scan, oneshot
    except Exception as e:
        exit('Configuration {}\n please check inotify-spamlearn.cfg'.format(e))


def process(filename, spamcmd, delete, initiator):
    cmd = ' '.join([spamcmd, filename])
    if os.path.exists(filename):
        try:
            p = subprocess.Popen(cmd.split(' '), stdout=subprocess.PIPE)
            learning, output_err = p.communicate()
            logging.info('Processing [%s] %s: %s' % (initiator, filename, str(learning.decode('utf-8')).strip('\n')))

        except Exception as e:
            logging.warning('Processing failed [{}]: '.format(e))
        else:
            if delete:
                logging.info('Removing file: {}'.format(filename))
                os.remove(filename)
    else:
        logging.warning('File %s does not exist (anymore)' % filename)


def scandirs(spam_dir, ham_dir, spamcmd, hamcmd, delete):
    initiator = 'Dirscan'
    for checkdir in [spam_dir, ham_dir]:
        logging.info('Looking for existing files in {}'.format(checkdir))
        for spam in os.listdir(checkdir):
            try:
                if checkdir == spam_dir:
                    process('/'.join([checkdir, spam]), spamcmd, delete, initiator)
                elif checkdir == ham_dir:
                    process('/'.join([checkdir, spam]), hamcmd, delete, initiator)
            except Exception as e:
                logging.error('Cannot open path {} {}'.format(checkdir, e))
        logging.info('Finished looking for existing files in {}'.format(checkdir))


def inotified(spam_dir, ham_dir, spamcmd, hamcmd, delete):
    initiator = 'Inotify'
    i = inotify.adapters.Inotify()
    try:
        i.add_watch(spam_dir)
        i.add_watch(ham_dir)
    except Exception as e:
        logging.error('Cannot start inotify watch: {}'.format(e))
    else:
        logging.info('Inotify learning started')

    try:
        for event in i.event_gen():
            if event is not None:
                (header, type_names, watch_path, filename) = event
                if type_names[0] == 'IN_CLOSE_WRITE' and filename.endswith('.eml'):
                    if watch_path == spam_dir:
                        process('/'.join([watch_path, filename]), spamcmd, delete, initiator)
                    elif watch_path == ham_dir:
                        process('/'.join([watch_path, filename]), hamcmd, delete, initiator)

    finally:
        i.remove_watch([spam_dir, ham_dir])


def main():
    (spam_dir, ham_dir, spamcmd, hamcmd, logfile, loglevel, delete, scan, oneshot) = getconfig()
    loglevel = getattr(logging, loglevel.upper(), 'INFO')
    logging.basicConfig(format='%(asctime)s %(levelname)s %(message)s', filename=logfile, level=loglevel,datefmt='%Y-%m-%d %H:%M:%S')
    logging.info('Starting inotify-spamlearn.py')
    scanthread = threading.Thread(name='Scan Directories', target=scandirs,
                                  args=(spam_dir, ham_dir, spamcmd, hamcmd, delete))
    inotifythread = threading.Thread(name='Inotify Handling', target=inotified,
                                     args=(spam_dir, ham_dir, spamcmd, hamcmd, delete))
    if scan:
        scanthread.start()
    if not oneshot:
        inotifythread.start()


if __name__ == '__main__':
    main()
