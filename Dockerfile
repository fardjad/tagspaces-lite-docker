FROM debian:latest AS builder
RUN apt-get update && apt-get install -y \
    unzip \
    && rm -rf /var/lib/apt/lists/*
COPY tagspaces-web.zip .
RUN unzip tagspaces-web.zip

FROM nginxinc/nginx-unprivileged:stable
USER root
RUN rm -rf /usr/share/nginx/html
COPY --from=builder web /usr/share/nginx/html
USER nginx
EXPOSE 8080