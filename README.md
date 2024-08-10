# TagSpaces Lite Docker Image

This repository contains a GitHub Actions workflow to build an always up-to-date
Docker image for [TagSpaces Lite Web](https://www.tagspaces.org/products/).

While the folks at TagSpaces provide a
[Docker Image](https://hub.docker.com/r/tagspaces/tagspaces-lite-web), it is not
always up to date and runs nginx as root. I created this repository to build a
multi-arch image based on
[nginxinc/nginx-unprivileged](https://hub.docker.com/r/nginxinc/nginx-unprivileged)
every time a new version of [TagSpaces](https://github.com/tagspaces/tagspaces)
is released.

## How It Works

The workflow in this repository is triggered by a cron job that runs every day.
It checks the
[latest release](https://github.com/tagspaces/tagspaces/releases/latest) of
TagSpaces and compares it with the latest published image on Docker Hub. If the
release is newer than the image, it builds a new image and pushes it to
DockerHub.

## How to Use

You can use this image in the same way you would use the official one. The
official guide is available
[here](https://docs.tagspaces.org/tutorials/tagspaces-web-docker). The only
major difference is that this image uses port 8080 instead of port 80.

Here's an example `docker-compose.yml` file to help you get started quickly:

```yaml
services:
  tagspaces-lite-web:
    image: fardjad/tagspaces-lite-web:latest
    network_mode: bridge
    restart: unless-stopped
    container_name: tagspaces-lite-web
    ports:
      - "8080:8080"
```

### Example

You can find an example setup of TagSpaces Lite with S3Proxy
[here](./examples/s3proxy/). The following software is required to run the
example:

- Docker with Docker Compose
- curl
- jq

To run the example, execute the following commands:

```bash
./download-latest-tagspaces-web.sh
cd examples/s3proxy
docker-compose up
```

Then, open your browser and navigate to `http://localhost:8080`.
