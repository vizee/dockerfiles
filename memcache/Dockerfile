FROM ubuntu:14.04
MAINTAINER vizee <vizee@live.cn>

ENV DEBIAN_FRONTEND noninteractive
RUN echo "Asia/Shanghai" > /etc/timezone && dpkg-reconfigure -f noninteractive tzdata

RUN mv /etc/apt/sources.list /tmp/ && cat /tmp/sources.list | sed 's/archive.ubuntu.com/mirrors.aliyun.com/' > /etc/apt/sources.list && apt-get update

RUN apt-get install -y memcached

RUN rm -rf /var/lib/apt/lists/*

USER memcache

EXPOSE 11211

CMD memcached
