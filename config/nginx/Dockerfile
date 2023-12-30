FROM python:3.6

LABEL description="Certbot + nginxproxy soft-linker."
LABEL maintainer="Lieuwe Leene <lieuwe@leene.dev>"

COPY ./link_certificates.py /usr/bin/link_certificates.py

RUN python /usr/bin/link_certificates.py /etc/letsencrypt/live
