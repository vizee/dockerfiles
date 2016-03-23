FROM ubuntu:14.04
MAINTAINER vizee <vizee@live.cn>

ENV DEBIAN_FRONTEND noninteractive
RUN echo "Asia/Shanghai" > /etc/timezone && dpkg-reconfigure -f noninteractive tzdata

RUN mv /etc/apt/sources.list /tmp/ && cat /tmp/sources.list | sed 's/archive.ubuntu.com/cn.archive.ubuntu.com/' > /etc/apt/sources.list && apt-get update

RUN apt-get install -y nginx php5-fpm supervisor php5-mcrypt && rm -rf /var/lib/apt/lists/*

COPY ./supervisor.conf /etc/supervisor/
COPY ./nginx/pma /etc/nginx/sites-available/
RUN rm -f /etc/nginx/sites-enabled/default && ln -snf /etc/nginx/sites-available/pma /etc/nginx/sites-enabled/pma

EXPOSE 80

COPY ./app/pma/* /app/pma/
COPY ./config/* /etc/phpmyadmin/

CMD ["supervisord", "-n", "-c", "/etc/supervisor/supervisor.conf"]
