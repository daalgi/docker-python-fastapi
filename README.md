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

Run image as a container including networking including the flag `--publish [host port]:[container port]`:
```
docker run --name fastapi --publish 8080:8080 python-fastapi
```

You can change the publishing port outside the container, for instance `1234`:
```
docker run --name fastapi --publish 1234:8080 python-fastapi
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

## Deploy to Google Cloud Platform
We need to build the container image on GCP. First initialize  and select project in GCP:
```
# Initialize and select project
gcloud init

# or select the project directly
gcloud config set project docker-python-fastapi

# retrieve project-id of active project
gcloud config get-value project
```

First, you need to make sure that you have the Cloud Build API enabled. Run the following command to enable it:
```gcloud services enable cloudbuild.googleapis.com```

After the API is enabled, run the following command in Cloud Shell to start the build process:
```
gcloud builds submit --tag gcr.io/${GOOGLE_CLOUD_PROJECT}/monolith:1.0.0 .
gcloud builds submit --tag gcr.io/$docker-python-fastapi/monolith:1.0.0 .
```

Create an `app.yaml` file. Then deploy and select region (follow instructions)
````
gcloud app deploy
````

## Deploy on Deta