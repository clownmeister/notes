FROM node:18-alpine3.18

USER root

RUN apk add --update --no-cache && \
    apk --no-cache --virtual build-dependencies add \
    make \
    bash
#    python3 \



RUN mkdir -p /.cache/yarn && chmod 777 -R /.cache
RUN mkdir /.yarn && chmod 777 -R /.yarn

WORKDIR /var/www