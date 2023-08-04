FROM lts-alpine3.18

RUN apk add --no-cache bash
RUN mkdir -p /.cache/yarn && chmod 777 -R /.cache
RUN mkdir /.yarn && chmod 777 -R /.yarn

WORKDIR /var/www