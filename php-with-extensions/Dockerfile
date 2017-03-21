FROM alpine:edge

MAINTAINER Sam Mousa <sam@mousa.nl>

RUN echo "http://dl-cdn.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories

RUN apk add --update --no-cache \
    tini \
    curl \
    git \
    openssh-client \
    poppler-utils \
    php7.1 \
    php7.1-sockets \
    php7.1-xml \
    php7.1-xmlreader \
    php7.1-pdo_mysql \
    php7.1-intl \
    php7.1-sockets \
    php7.1-pcntl \
    php7.1-zip \
    php7.1-json \
    php7.1-phar \
    php7.1-dom \
    php7.1-mbstring \
    php7.1-zlib \
    php7.1-ctype \
    php7.1-pcntl \
    php7.1-curl



# Add php.ini directives.
RUN echo memory_limit=1G > /etc/php7.1/php.ini

# Install composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/bin --filename=composer && \
    composer global config bin-dir /bin && \
    composer global config vendor-dir /vendor

# fxp/composer-asset-plugin && codeception
RUN composer -n global require fxp/composer-asset-plugin codeception/codeception redcomponent/teststatistics && \
    composer clear-cache

# Install php wait-for-it
RUN cd /tmp && \
    git clone  --branch v0.6.0 https://github.com/SAM-IT/wait-for-it-php.git && \
    cd wait-for-it-php && \
    composer install && \
    php -d phar.readonly=0 build.php && \
    cp wait-for-it.phar /bin/wait-for-it && \
    rm -rf /tmp/*

WORKDIR /project