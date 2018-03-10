#! /bin/bash
set -eo pipefail

echo "Downloading certs"
aws s3 cp 's3://yatlab-secrets/certs/privkey.pem' '/etc/ssl/private/terminal_space_privkey.pem' --sse
aws s3 cp 's3://yatlab-secrets/certs/cert.pem' '/etc/ssl/certs/terminal_space_cert.pem' --sse
aws s3 cp 's3://yatlab-secrets/certs/fullchain.pem' '/etc/ssl/certs/terminal_space_fullchain.pem' --sse
echo "Finished downloading certs, running nginx"
nginx -g 'daemon off;'
