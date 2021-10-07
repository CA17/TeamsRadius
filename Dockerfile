FROM freeradius/freeradius-server:latest

RUN apt-get update
RUN apt install -y net-tools vim tcpdump iproute2 curl \
    && apt-get clean \
    && rm -r /var/lib/apt/lists/*

USER root
COPY freeradius/ /etc/raddb/
COPY lfreemate /usr/sbin/lfreemate
RUN chmod +x /usr/sbin/lfreemate
