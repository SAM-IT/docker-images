FROM php:7-alpine

MAINTAINER Sam Mousa <sam@mousa.nl>

# Add php.ini directives.
RUN echo memory_limit=1G > /usr/local/etc/php/php.ini

RUN apk add --update --no-cache icu-dev tini git
RUN docker-php-ext-install sockets pcntl intl pdo pdo_mysql

# Install composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/bin --filename=composer


# Install php wait-for-it
RUN cd /tmp && \
    git clone  --branch v0.6.0 https://github.com/SAM-IT/wait-for-it-php.git && \
    cd wait-for-it-php && \
    composer install && \
    php -d phar.readonly=0 build.php && \
    cp wait-for-it.phar /bin/wait-for-it && \
    rm -rf /tmp/*


ENTRYPOINT ["/sbin/tini", "--"]
# Install php-gd
#RUN apt-get update && \
#    apt-get -y install libjpeg-dev libpng-dev libfreetype6-dev && \
#    docker-php-ext-configure gd --with-png-dir=/usr --with-jpeg-dir=/usr && \
#    docker-php-ext-install gd && \
#    apt-get -y purge libpng-dev libfreetype6-dev && \
#    rm -rf /var/lib/apt/lists/*
#
## Install php mcrypt.
#RUN apt-get update && \
#    apt-get -y install --no-install-recommends libmcrypt-dev && \
#    docker-php-ext-install mcrypt && \
#    apt-get -y purge libmcrypt-dev && \
#    rm -rf /var/lib/apt/lists/*
