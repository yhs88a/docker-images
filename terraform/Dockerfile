# syntax=docker/dockerfile:1

# renovate: datasource=docker depName=yhs88a/alpine-ci
ARG BASE_VERSION=3.20.3

FROM yhs88a/alpine-ci:${BASE_VERSION:-latest} AS base

LABEL maintainer="Anthony Yung <yhs88a@gmail.com>" \
    org.opencontainers.image.source="https://github.com/yhs88a/docker-images"

FROM base AS build

# renovate: datasource=github-releases depName=hashicorp/terraform
ARG IMAGE_VERSION=1.9.8
# renovate: datasource=github-releases depName=gruntwork-io/terragrunt
ARG TERRAGRUNT_VERSION=0.68.7
# renovate: datasource=github-releases depName=terraform-docs/terraform-docs
ARG TERRAFORMDOCS_VERSION=0.19.0

RUN case `uname -m` in \
    x86_64) ARCH=linux_amd64; ;; \
    aarch64) ARCH=linux_arm64; ;; \
    *) echo "un-supported arch, exit ..."; exit 1; ;; \
    esac \
    && echo $ARCH > /tmp/ARCH \
    && cat /tmp/ARCH

RUN apk add --no-cache curl unzip tar

RUN export ARCH=$(cat /tmp/ARCH) \
    && curl -fsSL https://releases.hashicorp.com/terraform/${IMAGE_VERSION}/terraform_${IMAGE_VERSION}_${ARCH}.zip -o /tmp/terraform_${IMAGE_VERSION}_${ARCH}.zip \
    && unzip /tmp/terraform_${IMAGE_VERSION}_${ARCH}.zip -d /tmp \
    && mv /tmp/terraform /usr/local/bin/terraform

RUN export ARCH=$(cat /tmp/ARCH) \
    && curl -fsSL https://github.com/gruntwork-io/terragrunt/releases/download/v${TERRAGRUNT_VERSION}/terragrunt_${ARCH} -o /tmp/terragrunt_${ARCH} \
    && mv /tmp/terragrunt_$ARCH /usr/local/bin/terragrunt

RUN export ARCH=$(cat /tmp/ARCH | sed 's/_/-/g') \
    && curl -fsSL https://github.com/terraform-docs/terraform-docs/releases/download/v${TERRAFORMDOCS_VERSION}/terraform-docs-v${TERRAFORMDOCS_VERSION}-${ARCH}.tar.gz -o /tmp/terraform-docs-v${TERRAFORMDOCS_VERSION}-${ARCH}.tar.gz \
    && tar -xvf /tmp/terraform-docs-v${TERRAFORMDOCS_VERSION}-${ARCH}.tar.gz -C /tmp \
    && mv /tmp/terraform-docs /usr/local/bin/terraform-docs

FROM base AS final

COPY --from=build /usr/local/bin/terraform /usr/local/bin/terraform
COPY --from=build /usr/local/bin/terragrunt /usr/local/bin/terragrunt
COPY --from=build /usr/local/bin/terraform-docs /usr/local/bin/terraform-docs

RUN chmod +x /usr/local/bin/terraform /usr/local/bin/terragrunt /usr/local/bin/terraform-docs

USER root
