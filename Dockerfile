FROM python:3.6-stretch

MAINTAINER Christoffer Holmberg <christoffer.holmberg@ksfmedia.fi>

# Install dependencies

RUN echo "deb http://packages.cloud.google.com/apt cloud-sdk-stretch main" | \
    tee -a /etc/apt/sources.list.d/google-cloud-sdk.list && \
    curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | \
    apt-key add - &&\
    apt-get update && apt-get install -yqq tzdata vim htop wget curl \
    alien libaio1 libaio-dev screen iproute2 unzip tree google-cloud-sdk \
    default-jre default-jdk socat

# Cleanup

RUN apt-get -yqq autoremove && apt-get -yqq autoclean

# Install python packages

COPY requirements.txt /requirements.txt
RUN pip install -r /requirements.txt
