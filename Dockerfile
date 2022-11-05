FROM alpine

MAINTAINER Lieuwe Leene

ARG SSL_ALGO=secp521r1

RUN apk update && \
  apk add --no-cache openssl && \
  rm -rf /var/cache/apk/*

COPY ./mail/certs /certs

RUN openssl ecparam -name ${SSL_ALGO} -genkey | openssl pkey -out /certs/ecprivkey.pem && \
    openssl pkey -in /certs/ecprivkey.pem -pubout -out /certs/ecpubkey.pem
