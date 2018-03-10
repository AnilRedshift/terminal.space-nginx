#! /bin/bash
set -eo pipefail

aws s3 cp 's3://yatlab-secrets/certs/privkey.pem' '/etc/ssl/private/terminal_space_privkey.pem'
aws s3 cp 's3://yatlab-secrets/certs/cert.pem' '/etc/ssl/certs/terminal_space_cert.pem'
aws s3 cp 's3://yatlab-secrets/certs/fullchain.pem' '/etc/ssl/certs/terminal_space_fullchain.pem'
nginx -g daemon off
