#!/bin/bash

# Source our persisted env variables from container startup
. /etc/transmission/environment-variables.sh

echo 'STARTING SABNZBD'
exec su --preserve-environment ${RUN_AS} -s /bin/bash -c "/usr/bin/python2.7 -OO /usr/bin/sabnzbdplus -f ${SABNZBD_HOME} -s ${SABNZBD_BIND_ADDRESS}:${SABNZBD_PORT} ${SABNZBD_OPTS}" &
