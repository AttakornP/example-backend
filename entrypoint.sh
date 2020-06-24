#!/bin/bash

python manage.py migrate
uwsgi --http-socket 0.0.0.0:8080 --module hello_world.wsgi:application --check-static ./