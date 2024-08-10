# TagSpaces Lite Docker Image

This repository contains a GitHub Actions workflow to build an always up-to-date
Docker image for [TagSpaces Lite Web](https://www.tagspaces.org/products/).

The folks at TagSpaces already provide a
[Docker Image](https://hub.docker.com/r/tagspaces/tagspaces-lite-web), but it's
not up to date, so I created this repository to automate the process of building
a new image whenever a new version of
[TagSpaces](https://github.com/tagspaces/tagspaces) is released.

## How It Works

The workflow in this repository is triggered by a cron job that runs every day.
It checks the
[latest release](https://github.com/tagspaces/tagspaces/releases/latest) of
TagSpaces and compares it with the latest published image on Docker Hub. If the
release is newer than the image, it builds a new image and pushes it to
DockerHub.

## How to Use

You can use this image as you would use the official one. The official guide is
available [here](https://docs.tagspaces.org/tutorials/tagspaces-web-docker).
