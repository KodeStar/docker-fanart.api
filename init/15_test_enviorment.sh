#!/bin/bash

echo "Testing enviorment:"
if [ -z $APIKEY ]; then
	echo "APIKEY not set, exiting"
	exit 1
fi
if [ -z $IMGCACHE ]; then
	export IMGCACHE=false
fi
