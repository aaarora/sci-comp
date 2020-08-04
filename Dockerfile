FROM ubuntu:latest

LABEL maintainer Aashay <aaarora@ucsd.edu>

RUN apt-get -y update

RUN apt-get -y install build-essential
    apt-get -y install conda && \
    apt-get -y install vim && \
    apt-get -y install supervisor

RUN mkdir -p /var/log/supervisor

ADD supervisord.conf /etc/supervisor/supervisord.conf

CMD ["exec /usr/bin/supervisord -c /etc/supervisord.conf"]
