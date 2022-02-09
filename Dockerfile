FROM debian
MAINTAINER Alejandro Domínguez Alcocer "alejandroomin@gmail.com"

COPY django_tutorial /usr/share/django_tutorial
WORKDIR /usr/share/django_tutorial

RUN apt-get update && apt-get install -y python3-pip libapache2-mod-wsgi-py3 default-libmysqlclient-dev && apt-get clean && rm -rf /var/lib/apt/lists/* && chmod u+x /usr/share/django_tutorial/docker-entrypoint.sh

RUN pip3 install --no-cache-dir -r requirements.txt && pip install uwsgi && pip install mysqlclient

ENV DATABASE_USER django
ENV DATABASE_PASSWORD django
ENV DATABASE_HOST bd
ENV DATABASE_NAME django
ENV ADMIN_NAME admin
ENV ADMIN_PASS admin

EXPOSE 8080
CMD [ "bash", "/usr/share/django_tutorial/docker-entrypoint.sh"]
