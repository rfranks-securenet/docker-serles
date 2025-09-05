# SPDX-FileCopyrightText: 2025 Richard Franks
#
# SPDX-License-Identifier: GPL-3.0-only

FROM python:3.12-slim

LABEL org.opencontainers.image.authors="Richard Franks <richard.franks@securenetcoms.co.uk>"
LABEL org.opencontainers.image.base.name="hub.docker.com/_/python:3.12-slim"
LABEL org.opencontainers.image.description="Docker image for serles ACME server."
LABEL org.opencontainers.image.ref.name="serles"
LABEL org.opencontainers.image.title="serles"
LABEL org.opencontainers.image.version="1.1.0"
LABEL org.opencontainers.image.source="https://github.com/rfranks-securenet/docker-serles"
LABEL org.opencontainers.image.url="https://github.com/rfranks-securenet/docker-serles"

VOLUME [ "/etc/serles" ]
EXPOSE 8000

RUN python3 -m venv /serles
RUN /serles/bin/python3 -m pip install --upgrade pip
RUN /serles/bin/python3 -m pip install serles-acme==1.2.0
RUN /serles/bin/python3 -m pip install certbot==5.0.0
RUN /serles/bin/python3 -m pip install certbot-dns-cloudflare==5.0.0
RUN mkdir -p /etc/serles/letsencrypt /etc/serles/lib/letsencrypt /etc/serles/log/letsencrypt
COPY gunicorn_config.py /serles/gunicorn_config.py
COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/bin/sh", "/entrypoint.sh"]
