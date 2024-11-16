# terraform

[![Build status](https://github.com/yhs88a/docker-images/actions/workflows/build-terraform.yml/badge.svg)](https://github.com/yhs88a/alpine/actions/workflows/build-terraform.yml)
[![Docker Image Size (latest)](https://img.shields.io/docker/image-size/yhs88a/terraform/latest)](https://hub.docker.com/r/yhs88a/terraform)
[![Docker Pulls](https://img.shields.io/docker/pulls/yhs88a/terraform)](https://hub.docker.com/r/yhs88a/terraform)
[![Renovate enabled](https://img.shields.io/badge/renovate-enabled-brightgreen.svg)](https://renovatebot.com/)
[![Licence: MIT](https://img.shields.io/github/license/yhs88a/docker-images)](https://github.com/yhs88a/docker-images/blob/main/LICENSE)

## Description

`terraform` Docker image. It is maintained and published under the `yhs88a` Docker Hub account.

[https://hub.docker.com/r/yhs88a/terraform](https://hub.docker.com/r/yhs88a/terraform)

## Docker Image

- **Image Name**: `terraform`
- **Group**: `ci`
- **Docker Hub Username**: `yhs88a`
- **Supported Platforms**: `linux/amd64,linux/arm64`
- **Base Image**: `alpine`
- **Datasource**: `github-releases`
- **Depname**: `hashicorp/terraform`

## Tags

The Docker image is tagged as follows:

```
"${OWNER}/${FILE}"
"${OWNER}/${FILE}:${TAG}"
"${OWNER}/${FILE}:${BASE_IMAGE}${BASE_VERSION}"
"${OWNER}/${FILE}:${TAG}-${BASE_IMAGE}${BASE_VERSION}"
```

## Usage

To pull and run the Docker image, use the following commands:

```bash
# Pull the image
docker pull yhs88a/terraform:latest

# Run the image
docker run --name <container_name> -d yhs88a/terraform:latest
```
