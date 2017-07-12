FROM node:6
MAINTAINER Martin Meredith

# Let the container know that there is no tty
ENV DEBIAN_FRONTEND noninteractive

# Tell npm to display only warnings and errors
ENV NPM_CONFIG_LOGLEVEL warn

# Disable composer interaction, and root user and xdebug warnings
ENV COMPOSER_NO_INTERACTION 1
ENV COMPOSER_ALLOW_SUPERUSER 1
ENV COMPOSER_DISABLE_XDEBUG_WARN 1

ADD / /
RUN /scripts/add-jessie-sury-repo
RUN /scripts/install-essentials
RUN /scripts/install-php7
RUN /scripts/install-composer
RUN /scripts/cleanup

# Show versions
RUN php --version
RUN composer --version
