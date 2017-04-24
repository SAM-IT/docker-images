FROM mariadb
# Prepare the database.
RUN mysql_install_db \
    --user=mysql \
    --datadir=/var/lib/mysql-template \
    --skip-name-resolve \
    --cross-bootstrap \
    && rm /var/lib/mysql-template/ib_logfile*
COPY prepare.sh /prepare.sh
RUN /prepare.sh
#RUN mysqld --initialize --user=mysql
RUN apt-get update && apt-get install -y --no-install-recommends
ENV TINI_VERSION v0.14.0
ENV GIDDYUP_VERSION v0.16.0
ADD https://github.com/rancher/giddyup/releases/download/v0.16.0/giddyup /bin/giddyup
ADD https://github.com/krallin/tini/releases/download/${TINI_VERSION}/tini /bin/tini
ADD https://github.com/krallin/tini/releases/download/${TINI_VERSION}/tini.asc /bin/tini.asc
RUN gpg --keyserver ha.pool.sks-keyservers.net --recv-keys 595E85A6B1B4779EA4DAAEC70B588DFF0527A9B7 \
 && gpg --verify /bin/tini.asc \
 && rm /bin/tini.asc \
 && chmod +x /bin/tini \
 && chmod +x /bin/giddyup
COPY docker-entrypoint.sh /usr/local/bin/
ENTRYPOINT ["/bin/tini", "--", "/usr/local/bin/docker-entrypoint.sh"]
CMD ["mysqld"]