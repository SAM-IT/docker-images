FROM php:7.0-fpm
MAINTAINER Sam Mousa <sam@mousa.nl>

RUN docker-php-ext-install pdo pdo_mysql sockets pcntl mbstring

# Install php-intl
RUN apt-get update && \
    apt-get -y install --no-install-recommends libicu-dev && \
    docker-php-ext-install intl && \
    apt-get -y purge libicu-dev && \
    rm -rf /var/lib/apt/lists/*

# Install php-gd
RUN apt-get update && \
    apt-get -y install --no-install-recommends libjpeg-dev libpng-dev libfreetype6-dev && \
    docker-php-ext-configure gd --with-png-dir=/usr --with-jpeg-dir=/usr --with-freetype-dir=/usr && \
    docker-php-ext-install gd && \
    apt-get -y purge libpng-dev libfreetype6-dev && \
    rm -rf /var/lib/apt/lists/*

# Install php mcrypt.
RUN apt-get update && \
    apt-get -y install --no-install-recommends libmcrypt-dev && \
    docker-php-ext-install mcrypt && \
    apt-get -y purge libmcrypt-dev && \
    rm -rf /var/lib/apt/lists/*

# Install git.
RUN apt-get update && \
    apt-get -y install --no-install-recommends GIT && \
    rm -rf /var/lib/apt/lists/*

# Install sassc
RUN cd /tmp && \
    git clone https://github.com/sass/libsass.git && \
    export SASS_LIBSASS_PATH=/tmp/libsass && \
    git clone https://github.com/sass/sass-spec.git && \
    export SASS_SPEC_PATH=/tmp/sass-spec && \
    git clone https://github.com/sass/sassc.git && \
    cd libsass && \
    make && \
    cd .. && \
    cd sassc && \
    script/bootstrap && \
    make && \
    mv bin/sassc /bin/sassc && \
    rm -rf /tmp/*

RUN mkdir /project && chown www:www /project
VOLUME /project

ENTRYPOINT []
CMD ["php-fpm"]
