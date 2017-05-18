FROM alpine

MAINTAINER Sam Mousa <sam@mousa.nl>

# We keep build-base since it is required for building node-sass.
RUN apk add --no-cache --update curl tar

# Add rancher-cli.
RUN curl -L https://releases.rancher.com/cli/v0.4.1/rancher-linux-amd64-v0.4.1.tar.gz | \
    tar xz --strip-components 2 -C /bin
