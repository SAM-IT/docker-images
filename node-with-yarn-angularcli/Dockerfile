FROM node:alpine

MAINTAINER Sam Mousa <sam@mousa.nl>

# We keep build-base since it is required for building node-sass.
RUN apk add --no-cache --update build-base python curl && \
    npm install -g --no-optional --only=prod angular-cli && \
    npm cache clean
