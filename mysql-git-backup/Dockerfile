FROM alpine

MAINTAINER Sam Mousa <sam@mousa.nl>
RUN apk add --update --no-cache mariadb-client git parallel openssh-client
RUN mkdir /backup
COPY backup.sh /backup.sh
CMD /backup.sh
RUN mkdir -p /root/.ssh && echo -e "StrictHostKeyChecking no\n" >> /root/.ssh/config