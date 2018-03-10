FROM nginx:1.13.9
RUN apt-get update -y

# Install the aws cli
RUN apt-get install -y python3 curl unzip
RUN curl "https://s3.amazonaws.com/aws-cli/awscli-bundle.zip" -o "/tmp/awscli-bundle.zip"
RUN unzip /tmp/awscli-bundle.zip -d /tmp
RUN python3 /tmp/awscli-bundle/install -i /usr/local/aws -b /usr/local/bin/aws
RUN rm -rf /tmp/awscli-bundle
RUN rm -rf /tmp/awscli-bundle.zip

COPY nginx.conf /etc/nginx/nginx.conf
