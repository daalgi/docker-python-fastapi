# docker-python-fastapi

Dockerized python fastAPI server to be deployed in Google Cloud.

## FastAPI server
Run locally the server using FastAPI:
```
uvicorn main:app --reload
```
Open the browser at `localhost:8000`.
Open the browser at `localhost:8000/docs`.

## Dockerize (on Windows)
Open Docker Desktop and build the docker image:
```
docker build --tag python-fastapi .
```

Run image as a container:
```
docker run python-fastapi
```

**TODO** solve networking issue!

Run image as a container including networking including the flag `--publish [host port]:[container port]`:
```
docker run --name fastapi --publish 8080:8080 python-fastapi
```

Add `detach` to return you to the terminal prompt:
```
docker run --name fastapi --detach --publish 8080:8080 python-fastapi
```

List all running containers:
```
docker ps
```

Delete all containers:
```
docker rm -f $(docker ps -a -q)
```
## Run using a cloud server
TODO

## Deploy on Deta