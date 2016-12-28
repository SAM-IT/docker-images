FROM node:alpine

MAINTAINER Sam Mousa <sam@mousa.nl>

# We keep build-base since it is required for building node-sass.
RUN apk add --no-cache --update build-base python curl
RUN mkdir -p /opt/yarn && \
    curl -L https://yarnpkg.com/latest.tar.gz | tar xzv -C /opt/yarn && \
    # Import latest exec script so it allows symlink. #1678
    curl -L https://raw.githubusercontent.com/yarnpkg/yarn/master/bin/yarn -o /opt/yarn/dist/bin/yarn && \
    ln -s /opt/yarn/dist/bin/yarn /bin/yarn
RUN yarn global add angular-cli