# terminal.space-nginx

This handles all web routes to *.terminal.space

## Installation
This is just a Docker build, so there's no installation other than docker needed
1. `git clone git@github.com:AnilRedshift/yatlab.git`
1. Add the following secrets to your environment:
    * AWS_ACCESS_KEY_ID (Your AWS login user)
    * AWS_SECRET_ACCESS_KEY (Your AWS secret)
    * AWS_DEFAULT_REGION (us-east-1)
    * CERT_BUCKET (my-s3-bucket)
1. docker-compose build
1. docker-compose up
1. Navigate to http://localhost:3000

## Updating dhparam.pem
`openssl dhparam -out /etc/nginx/ssl/dhparam.pem 4096`
