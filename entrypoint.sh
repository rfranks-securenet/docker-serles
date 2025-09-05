#!/bin/bash

set -e

chown -R nobody:nogroup /etc/serles || true

runuser -u nobody -- /serles/bin/gunicorn -c /serles/gunicorn_config.py "serles:create_app()"