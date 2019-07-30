# set the base image
FROM python:3.6.8

ENV PYTHONUNBUFFERED 1

# File Author / Maintainer
MAINTAINER caixinglong@xigua.city

#set directoty where CMD will execute
WORKDIR /var/www/blog

RUN mkdir -p /var/www/blog/log

COPY requirements.txt ./
# Get pip to download and install requirements:
RUN pip install -r requirements.txt -i http://mirrors.aliyun.com/pypi/simple/ --trusted-host mirrors.aliyun.com

#add project files to the usr/src/app folder
ADD . /var/www/blog

# Expose ports
EXPOSE 8080
# RUN python manage.py migrate
# default command to execute
#CMD exec gunicorn project.wsgi:application -c /var/www/aliyun-service/deploy/gunicorn.conf.py --chdir=/var/www/aliyun-service
#CMD python manage.py runserver 0.0.0.0:8080

