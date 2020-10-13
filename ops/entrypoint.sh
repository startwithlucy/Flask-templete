#!/bin/bash
set -e

# Start codeserver
/usr/bin/dumb-init -- fixuid -q --
/usr/bin/code-server --bind-addr 0.0.0.0:8080 . &

cp interview/nginx/nginx.conf /etc/nginx/conf.d
rm -f /etc/nginx/sites-enabled/default

exec "$@"
