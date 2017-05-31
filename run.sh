#!/bin/sh
set -e
if test -e /nginx.conf; then
    cp -v /nginx.conf /etc/nginx/nginx.conf
else
    curl -O /etc/nginx/nginx.conf $S3_LOCATION
fi
exec dockerize -stdout /var/log/nginx/access.log -stderr /var/log/nginx/error.log /usr/sbin/nginx -c /etc/nginx/nginx.conf -g "daemon off;"
