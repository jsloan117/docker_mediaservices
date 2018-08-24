#!/bin/bash

openssl req -newkey rsa:4096 -nodes -keyout /etc/ssl/private/mediaservices.key \
-x509 -sha512 -days 3650 -out /etc/ssl/certs/mediaservices.crt \
-subj "/C=US/ST=private/L=province/O=city/CN=hostname.example.com"
