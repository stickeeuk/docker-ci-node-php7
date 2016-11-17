FROM node:6
MAINTAINER Grzegorz Rajchman <mrliptontea@griego.pl>

# Let the container know that there is no tty
ENV DEBIAN_FRONTEND noninteractive
ENV COMPOSER_NO_INTERACTION 1

# Tell npm to display only warnings and errors
ENV NPM_CONFIG_LOGLEVEL warn

# Add basic repository
RUN echo "deb http://packages.dotdeb.org jessie all" >> /etc/apt/sources.list \
 && echo "deb-src http://packages.dotdeb.org jessie all" >> /etc/apt/sources.list \
 && wget -O- http://www.dotdeb.org/dotdeb.gpg | apt-key add - \
 && apt-get update \
 && apt-get upgrade -y

# Install essential tools
RUN apt-get install -y \
    git \
    zip \
    unzip \
    libfontconfig

# Install node tools
RUN npm install -g \
    node-gyp \
    yarn

# Install php 7 and its modules
RUN apt-get install -y \
    php7.0 \
    php7.0-mbstring \
    php7.0-mcrypt \
    php7.0-curl \
    php7.0-json \
    php7.0-xml \
    php7.0-zip \
    php7.0-bz2 \
    php7.0-sqlite3 \
    php7.0-mysql \
    php7.0-gd

# Install composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
RUN chmod a+x /usr/local/bin/composer
RUN composer selfupdate

# Clean up temporary files
RUN apt-get clean && apt-get autoclean && apt-get --purge -y autoremove && \
    npm cache clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Show versions
RUN node -v
RUN npm -v
RUN php -v
RUN composer -V
