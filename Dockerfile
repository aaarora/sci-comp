FROM ubuntu:latest
LABEL maintainer Aashay <aaarora@ucsd.edu>

RUN apt-get -y update
RUN apt-get -y upgrade

RUN apt-get -y install build-essential && \
    apt-get -y install vim && \
    apt-get -y install supervisor && \
    apt-get -y install python3

RUN apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN mkdir -p /var/log/supervisor
ADD supervisord.conf /etc/supervisor/supervisord.conf

CMD ["/usr/bin/supervisord", "-c", "/etc/supervisord.conf"]
