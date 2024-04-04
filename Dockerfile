FROM nginx:1.25.4-alpine3.18-slim
ARG WORKDIR=/usr/share/nginx/html
WORKDIR $WORKDIR
COPY ./src $WORKDIR
