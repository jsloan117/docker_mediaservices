#!/bin/sh

/etc/transmission/start.sh "$@"
#/etc/sabnzbd/start.sh
[ ! -f /opt/tinyproxy/start.sh ] || /opt/tinyproxy/start.sh
