#!/bin/bash

echo "Testing enviorment:"
if [ -z $APIKEY ]; then
	echo "APIKEY not set, exiting"
	exit 1
else
	/sbin/setuser abc echo $APIKEY > /config/APIKEY
fi