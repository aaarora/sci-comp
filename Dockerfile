FROM ubuntu:latest
LABEL maintainer Aashay <aaarora@ucsd.edu>

COPY requirements.txt ./

RUN apt-get -y update

RUN apt-get -y install build-essential && \
    apt-get -y install vim && \
    apt-get -y install supervisor && \
    apt-get -y install python3 && \
    apt-get -y install python3-pip

RUN apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN pip3 install -r requirements.txt

EXPOSE 80

RUN mkdir -p /var/log/supervisor
ADD supervisord.conf /etc/supervisor/supervisord.conf

CMD ["exec /usr/bin/supervisord -c /etc/supervisord.conf"]
