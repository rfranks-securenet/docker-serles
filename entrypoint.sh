#!/bin/bash

set -e

/serles/bin/gunicorn -c /serles/gunicorn_config.py "serles:create_app()"