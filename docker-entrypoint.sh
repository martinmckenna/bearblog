#!/bin/bash

# Collect static files
echo "Collect static files"
python manage.py collectstatic --noinput --clear

echo "Starting server"
gunicorn -w 3 --bind 0.0.0.0:8080 textblog.wsgi --log-file -
