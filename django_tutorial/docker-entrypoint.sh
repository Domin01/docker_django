#!/bin/bash

sleep 10

python3 manage.py migrate

echo "from django.contrib.auth import get_user_model; User = get_user_model(); User.objects.create_superuser('"`echo $ADMIN_NAME`"', 'prueba@gmail.com', '"`echo $ADMIN_PASS`"')" | python3 manage.py shell

python3 manage.py runserver 0.0.0.0:8080
