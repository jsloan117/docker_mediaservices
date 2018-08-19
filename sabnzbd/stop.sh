#!/bin/bash

echo 'STOPPING SABNZBD'
kill $(pidof python2.7)
