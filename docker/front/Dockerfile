FROM node:18-slim

ENV TZ Asia/Tokyo

WORKDIR /app

RUN apt-get update \
    && apt-get install -y \
    git \
    vim

EXPOSE 3000
ENV HOST 0.0.0.0
