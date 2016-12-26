FROM nginx:alpine

MAINTAINER Sam Mousa <sam@mousa.nl>

COPY nginx.conf /etc/nginx/conf.d/default.conf
COPY index.html /www/index.html
COPY start.sh /start.sh
CMD start.sh