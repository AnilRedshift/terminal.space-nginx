FROM nginx:1.13.9
ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get update -y
RUN apt-get install -y apt-utils

# Install the aws cli
RUN apt-get install -y python3 curl unzip vim
RUN curl "https://s3.amazonaws.com/aws-cli/awscli-bundle.zip" -o "/tmp/awscli-bundle.zip"
RUN unzip /tmp/awscli-bundle.zip -d /tmp
RUN python3 /tmp/awscli-bundle/install -i /usr/local/aws -b /usr/local/bin/aws
RUN rm -rf /tmp/awscli-bundle
RUN rm -rf /tmp/awscli-bundle.zip

# Add the appropriate files
COPY dhparam.pem /etc/nginx/dhparam.pem
COPY nginx.conf /etc/nginx/nginx.conf
COPY default.conf /etc/nginx/conf.d/default.conf
COPY run.sh /run.sh

CMD /run.sh
