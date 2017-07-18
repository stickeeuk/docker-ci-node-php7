FROM node:6
MAINTAINER Grzegorz Rajchman <grzegorz.rajchman@stickee.co.uk>

# Let the container know that there is no tty
ENV DEBIAN_FRONTEND noninteractive

# Tell npm to display only warnings and errors
ENV NPM_CONFIG_LOGLEVEL warn

# Disable composer interaction, and root user and xdebug warnings
ENV COMPOSER_NO_INTERACTION 1
ENV COMPOSER_ALLOW_SUPERUSER 1
ENV COMPOSER_DISABLE_XDEBUG_WARN 1

ADD / /
RUN /scripts/add-jessie-dotdeb-repo
RUN /scripts/install-essentials
RUN /scripts/install-python
RUN /scripts/install-pip
RUN /scripts/install-aws-cli
RUN /scripts/install-node-tools
RUN /scripts/install-php7
RUN /scripts/install-composer
RUN /scripts/cleanup

# Show versions
RUN node --version
RUN npm --version
RUN yarn --version
RUN php --version
RUN composer --version
