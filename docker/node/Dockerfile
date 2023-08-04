FROM node:18-alpine3.18

USER root

# install electron dependencies or more if your library has other dependencies
RUN apk add --update --no-cache && apk --no-cache add \
    git libx11-xcb1 libxcb-dri3-0 libxtst6 libnss3 libatk-bridge2.0-0 libgtk-3-0 libxss1 libasound2 \
    && apk add clean && rm -rf /var/lib/apt/lists/*

RUN apk add --update --no-cache && \
    apk --no-cache --virtual build-dependencies add \
    make \
    bash
#    python3 \

RUN chown root /app/node_modules/electron/dist/chrome-sandbox
RUN chmod 4755 /app/node_modules/electron/dist/chrome-sandbox

RUN mkdir -p /.cache/yarn && chmod 777 -R /.cache
RUN mkdir /.yarn && chmod 777 -R /.yarn

WORKDIR /var/www

USER node