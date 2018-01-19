FROM node:8

# Let the container know that there is no tty
ENV DEBIAN_FRONTEND noninteractive

# Tell npm to display only warnings and errors
ENV NPM_CONFIG_LOGLEVEL warn

# Disable composer interaction, and root user and xdebug warnings
ENV COMPOSER_NO_INTERACTION 1
ENV COMPOSER_ALLOW_SUPERUSER 1
ENV COMPOSER_DISABLE_XDEBUG_WARN 1

ADD / /
RUN /scripts/install-essentials
RUN /scripts/install-python
RUN /scripts/install-pip
RUN /scripts/install-aws-cli
RUN /scripts/install-node-tools
RUN /scripts/install-php72
RUN /scripts/install-composer

# Show versions
RUN node --version && \
    npm --version && \
    yarn --version && \
    php --version && \
    composer --version && \
    php -m
