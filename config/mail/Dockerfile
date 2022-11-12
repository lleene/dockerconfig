FROM alpine

MAINTAINER Lieuwe Leene

ARG SSL_ALGO=secp521r1

RUN apk update && \
  apk add --no-cache openssl && \
  rm -rf /var/cache/apk/*

RUN mkdir -p /etc/letsencrypt/live

RUN openssl ecparam -name ${SSL_ALGO} -genkey | openssl pkey -out /etc/letsencrypt/live/ecprivkey.pem && \
    openssl pkey -in /etc/letsencrypt/live/ecprivkey.pem -pubout -out /etc/letsencrypt/live/ecpubkey.pem
