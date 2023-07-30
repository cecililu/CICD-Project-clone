#!/bin/sh
python3 manage.py collectstatic --noinput
#python manage.py makemigrations --merge --noinput
python3 manage.py migrate --noinput
# python manage.py qcluster &
uwsgi --ini uwsgi.ini
