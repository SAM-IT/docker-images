FROM alpine

MAINTAINER Sam Mousa <sam@mousa.nl>

# We keep build-base since it is required for building node-sass.
RUN apk add --no-cache --update certbot

certbot certonly --standalone --standalone-supported-challenges http-01  --test --domains test.sam-it.eu
curl https://releases.rancher.com/cli/v0.4.0/rancher-linux-amd64-v0.4.0.tar.gz | tar -xz
mv rancher-v0.4.0/rancher /bin
rm -rf rancher-v0.4.0
