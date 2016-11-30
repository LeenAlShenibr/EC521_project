#!/bin/sh

export LD_LIBRARY_PATH="/usr/local/ssl/lib"
mkdir -p logs
./nginx -p . -c nginx.conf
