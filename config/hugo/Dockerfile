FROM alpine

LABEL description="Hugo static build process."
LABEL maintainer="Lieuwe Leene <lieuwe@leene.dev>"

ARG HUGO_BASE="localhost"
ARG SSL_ALGO=secp521r1

RUN wget -O - "https://github.com/gohugoio/hugo/releases/download/$(wget -O - https://api.github.com/repos/gohugoio/hugo/releases/latest | grep -om 1 "v[0-9.]*/hugo_extended_[0-9.]*_Linux-64bit.tar.gz")" | tar -xz -C /tmp \
    && mkdir -p /usr/local/sbin \
    && mv /tmp/hugo /usr/local/sbin/hugo \
    && rm -rf /tmp/${HUGO_ID}_linux_amd64 \
    && rm -rf /tmp/LICENSE.md \
    && rm -rf /tmp/README.md

RUN apk add --update git gcompat asciidoctor libc6-compat libstdc++ \
    && apk upgrade \
    && apk add --no-cache ca-certificates \
    && ln -s /lib/libc.so.6 /usr/lib/libresolv.so.2 \
    && git clone https://github.com/lleene/hugo-site.git /src \
    && git clone https://github.com/lleene/hermit.git /src/themes/hermit \
    && /usr/local/sbin/hugo -b ${BASE_URL}/ -s /src -d /public --minify

RUN apk update && \
    apk add --no-cache openssl && \
    rm -rf /var/cache/apk/*

WORKDIR /etc/letsencrypt/live

RUN openssl ecparam -name ${SSL_ALGO} -genkey | openssl pkey -out /etc/letsencrypt/live/ecprivkey.pem && \
    openssl pkey -in /etc/letsencrypt/live/ecprivkey.pem -pubout -out /etc/letsencrypt/live/ecpubkey.pem 
