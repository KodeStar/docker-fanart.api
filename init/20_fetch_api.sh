#!/bin/bash

if [ ! -d "/config/www/system" ]; then
rm -r /config/www
/sbin/setuser abc git clone https://github.com/KodeStar/pro-api.git /config/www
fi
