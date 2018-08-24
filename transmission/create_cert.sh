#!/bin/bash

# remove cert/key if they exist already
[[ -f /etc/ssl/certs/mediaservices.crt ]] && rm -f /etc/ssl/certs/mediaservices.crt
[[ -f /etc/ssl/private/mediaservices.key ]] && rm -f /etc/ssl/private/mediaservices.key

# always ensure we have values for cert
Country=${Country:-US}
State=${State:-Reach}
Locality=${Locality:-Sector9}
Company=${Company:-MediaServices}
Department=${Department:-Mediaservices}
HostName=${HostName:-MediaBox.local}

openssl req -newkey rsa:4096 -nodes -keyout /etc/ssl/private/mediaservices.key \
-x509 -sha512 -days 3650 -out /etc/ssl/certs/mediaservices.crt \
-subj "/C=${Country}/ST=${State}/L=${Locality}/O=${Company}/OU=${Department}/CN=${HostName}"
