#!/bin/sh
set -e

python manage.py migrate --noinput

exec gunicorn babyshop.wsgi:application --bind "0.0.0.0:${PORT}"
