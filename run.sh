#! /bin/bash
set -eo pipefail

echo "Downloading certs"

aws s3 cp "s3://$CERT_BUCKET/certs/privkey.pem" '/etc/ssl/private/terminal_space_privkey.pem' --sse
aws s3 cp "s3://$CERT_BUCKET/certs/cert.pem" '/etc/ssl/certs/terminal_space_cert.pem' --sse
aws s3 cp "s3://$CERT_BUCKET/certs/fullchain.pem" '/etc/ssl/certs/terminal_space_fullchain.pem' --sse

echo "Finished downloading certs, running nginx"
nginx -g 'daemon off;'
