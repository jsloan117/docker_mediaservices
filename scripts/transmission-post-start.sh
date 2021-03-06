#!/bin/bash

# Source our persisted env variables from container startup
. /etc/transmission/environment-variables.sh

echo 'STARTING SABNZBD'
exec su --preserve-environment ${RUN_AS} -s /bin/bash -c "/usr/bin/python2.7 -OO /usr/bin/sabnzbdplus -f ${SABNZBD_HOME} -s ${SABNZBD_BIND_ADDRESS}:${SABNZBD_PORT} ${SABNZBD_OPTS}" &

# Re-ensure these dirs have correct ownership
chown -R ${RUN_AS}:${RUN_AS} \
  ${TRANSMISSION_DOWNLOAD_DIR} \
  ${TRANSMISSION_INCOMPLETE_DIR} \
  ${TRANSMISSION_WATCH_DIR}

if [[ "${GENCERT}" == 'yes' ]]; then
  /etc/transmission/create_cert.sh
fi
