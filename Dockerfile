FROM golang:1.16.3-alpine

ARG BUILD_DATE

LABEL maintainer="boiu@bk.ru"
LABEL org.label-schema.build-date=$BUILD_DATE

ENV NODE_KEY idenaClient
ENV API_KEY idenaClientPassword
ENV CONF config
ENV VER nodaVersion

RUN wget -q -O /etc/apk/keys/sgerrand.rsa.pub https://alpine-pkgs.sgerrand.com/sgerrand.rsa.pub \
    && wget https://github.com/sgerrand/alpine-pkg-glibc/releases/download/2.33-r0/glibc-2.33-r0.apk \
    && apk add --no-cache bash glibc-2.33-r0.apk unzip 




 
ADD start.sh /

WORKDIR /app/idena

CMD ["/start.sh"]
