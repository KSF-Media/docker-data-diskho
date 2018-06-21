FROM ubuntu:16.04

MAINTAINER Christoffer Holmberg <christoffer.holmberg@ksfmedia.fi>

# Install dependencies

RUN apt-get update && apt-get install -yqq curl

RUN echo "deb http://packages.cloud.google.com/apt cloud-sdk-xenial main" | \
    tee -a /etc/apt/sources.list.d/google-cloud-sdk.list && \
    curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | \
    apt-key add - &&\
    apt-get update && apt-get install -yqq python3 python3-pip tzdata vim htop wget curl \
    alien libaio1 libaio-dev screen iproute2 unzip tree google-cloud-sdk \
    default-jre default-jdk socat

# Cleanup

RUN apt-get -yqq autoremove && apt-get -yqq autoclean

# Install python packages

COPY requirements.txt /requirements.txt
RUN pip install -r /requirements.txt
