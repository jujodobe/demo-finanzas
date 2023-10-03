FROM python:3.8-alpine

COPY requirements.txt .
RUN pip install --upgrade pip
RUN pip install pipenv
RUN apk add --update --no-cache --virtual .tmp gcc libc-dev
RUN pip install -r requirements.txt

WORKDIR /app

COPY . .

ENTRYPOINT python manage.py runserver 0.0.0.0:8088