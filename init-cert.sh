#!/bin/sh

OPENSSL=$(which openssl)

mkdir -p haproxy/ssl
$OPENSSL req -new -newkey rsa:8192 -days 365 -nodes -x509 -subj "/C=US/ST=Denial/L=Springfield/O=Dis/CN=server" -keyout server.key -out server.crt
cat server.crt > haproxy/ssl/default.crt
cat server.key >> haproxy/ssl/default.crt
rm -f server.crt
rm -f server.key
