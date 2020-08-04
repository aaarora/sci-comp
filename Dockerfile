FROM ubuntu:latest
LABEL maintainer Aashay <aaarora@ucsd.edu>

RUN apt-get -y update

RUN apt-get -y install build-essential && \
    apt-get -y install vim && \
    apt-get -y install supervisor && \
    apt-get -y install python3

RUN pip install numpy scipy matplotlib ipython jupyter pandas sympy

EXPOSE 80

RUN mkdir -p /var/log/supervisor
ADD supervisord.conf /etc/supervisor/supervisord.conf

CMD ["exec /usr/bin/supervisord -c /etc/supervisord.conf"]
