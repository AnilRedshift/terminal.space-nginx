# yatlab-nginx

This is a simple docker wrapper around nginx that reverse proxy's to http://localhost:3000

The code pulls the certs from an S3 bucket on startup. You'll need to set this up before running the server.

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

## Yatlab architecture overview
Yatlab is made out of 3 github repositories and 4 services

1. [yatlab-nginx](https://github.com/AnilRedshift/yatlab-nginx) handles traffic to https://yatlab.terminal.space and reverse-proxy's it to the web service
2. [yatlab](https://github.com/AnilRedshift/yatlab) Handles the website, and stores the data it receives in a database. The website is independent of the slack bot itself.
3. There is a postgres database which contains the data about the teams and acronyms
4. [yatlab-worker](https://github.com/AnilRedshift/yatlab-worker) polls the database for changes and connects to each slack team using the slack api
