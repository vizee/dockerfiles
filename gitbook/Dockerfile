FROM node:10.24.0-buster

ARG CALIBRE_VER=5.14.0

ADD ./calibre-$CALIBRE_VER-x86_64.txz /opt/calibre/

RUN apt update -y && apt install -y libgl1-mesa-glx libfontconfig1 && npm config set registry https://registry.npm.taobao.org && npm install -g gitbook-cli && gitbook fetch 3.2.3 && /opt/calibre/calibre_postinstall
