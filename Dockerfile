FROM python:3.6

MAINTAINER Christoffer Holmberg <christoffer.holmberg@ksfmedia.fi>

# Install apt packages

RUN apt-get update && apt-get install -yqq tzdata vim htop wget curl alien libaio1 libaio-dev screen iproute2 unzip
RUN apt-get -yqq autoremove && apt-get -yqq autoclean


COPY requirements.txt /requirements.txt
RUN pip install -r /requirements.txt
