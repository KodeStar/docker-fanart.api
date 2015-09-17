#!/bin/bash

if [ ! -d "/config/www/fanartapi" ]; then
/sbin/setuser abc git clone https://github.com/KodeStar/pro-api.git /config/www/fanartapi
fi
