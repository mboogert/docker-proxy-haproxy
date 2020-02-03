#!/bin/sh

DOMAIN="$1"
EMAIL="$2"

DOCKER_COMPOSE=$(which docker-compose)
$DOCKER_COMPOSE exec certbot /usr/local/bin/certbot certonly --webroot -w /usr/share/nginx/html -d $1 --non-interactive --agree-tos --email $EMAIL

cat certbot/live/$DOMAIN/fullchain.pem > haproxy/ssl/$DOMAIN.pem
cat certbot/live/$DOMAIN/privkey.pem >> haproxy/ssl/$DOMAIN.pem

$DOCKER_COMPOSE restart proxy-haproxy
