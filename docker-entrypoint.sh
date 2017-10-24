#!/bin/bash

/usr/bin/deluged -c $DELUGE_CONFIG

exec "$@"
