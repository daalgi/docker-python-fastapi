# https://docs.docker.com/language/python/build-images/
FROM python:3.8-buster

WORKDIR /app

COPY requirements.txt requirements.txt 

RUN pip3 install -r requirements.txt

COPY . . 

CMD [ "uvicorn", "main:app", "--reload", "--port", "8080" ]