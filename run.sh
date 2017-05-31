#!/bin/sh
set -e
if test -e /nginx.conf; then
    cp -v /nginx.conf /etc/nginx/nginx.conf
else
    aws s3 cp s3://$S3_LOCATION /etc/nginx/nginx.conf
fi
exec dockerize -stdout /var/log/nginx/access.log -stderr /var/log/nginx/error.log /usr/sbin/nginx -c /etc/nginx/nginx.conf -g "daemon off;"
