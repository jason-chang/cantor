#
#--------------------------------------------------------------------------
# Image Setup
#--------------------------------------------------------------------------
#

ARG CANTOR_PHP_VERSION
FROM php:${CANTOR_PHP_VERSION}-alpine

LABEL maintainer="Mahmoud Zalt <mahmoud@zalt.me>"

ARG CANTOR_PHP_VERSION

# If you're in China, or you need to change sources, will be set CHANGE_SOURCE to true in .env.

ARG CHANGE_SOURCE=false
RUN if [ ${CHANGE_SOURCE} = true ]; then \
    # Change application source from dl-cdn.alpinelinux.org to aliyun source
    sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/' /etc/apk/repositories \
;fi

RUN apk --update add wget \
  curl \
  git \
  build-base \
  libmcrypt-dev \
  libxml2-dev \
  pcre-dev \
  zlib-dev \
  autoconf \
  cyrus-sasl-dev \
  libgsasl-dev \
  oniguruma-dev \
  openssl \
  openssl-dev \
  supervisor

RUN docker-php-ext-install mysqli mbstring pdo pdo_mysql tokenizer xml pcntl
RUN if [ $(php -r "echo PHP_MAJOR_VERSION;") = "5" ]; then \
  pecl channel-update pecl.php.net && pecl install mcrypt-1.0.1 \
;else \
  pecl channel-update pecl.php.net && pecl install mcrypt-1.0.1 \
;fi

# Add a non-root user:
ARG PUID=1000
ENV PUID ${PUID}
ARG PGID=1000
ENV PGID ${PGID}

RUN addgroup -g ${PGID} cantor && \
    adduser -D -G cantor -u ${PUID} cantor

#Install BZ2:
ARG INSTALL_BZ2=false
RUN if [ ${INSTALL_BZ2} = true ]; then \
  apk --update add bzip2-dev; \
  docker-php-ext-install bz2; \
fi

#Install GD package:
ARG INSTALL_GD=false
RUN if [ ${INSTALL_GD} = true ]; then \
   apk add --update --no-cache freetype-dev libjpeg-turbo-dev jpeg-dev libpng-dev; \
   docker-php-ext-configure gd --with-freetype-dir=/usr/lib/ --with-jpeg-dir=/usr/lib/ --with-png-dir=/usr/lib/ && \
   docker-php-ext-install gd \
;fi

#Install ImageMagick:
ARG INSTALL_IMAGEMAGICK=false
RUN if [ ${INSTALL_IMAGEMAGICK} = true ]; then \
  apk add --update imagemagick-dev imagemagick; \
  pecl install imagick; \
  docker-php-ext-enable imagick \
;fi

#Install GMP package:
ARG INSTALL_GMP=false
RUN if [ ${INSTALL_GMP} = true ]; then \
   apk add --update --no-cache gmp gmp-dev \
   && docker-php-ext-install gmp \
;fi

#Install BCMath package:
ARG INSTALL_BCMATH=false
RUN if [ ${INSTALL_BCMATH} = true ]; then \
    docker-php-ext-install bcmath \
;fi

# Install MongoDB drivers:
ARG INSTALL_MONGO=false
RUN if [ ${INSTALL_MONGO} = true ]; then \
    if [ $(php -r "echo PHP_MAJOR_VERSION;") = "5" ]; then \
      pecl install mongo; \
      docker-php-ext-enable mongo; \
      php -m | grep -oiE '^mongo$'; \
    else \
      if [ $(php -r "echo PHP_MAJOR_VERSION;") = "7" ] && [ $(php -r "echo PHP_MINOR_VERSION;") != "4" ]; then \
        if [ $(php -r "echo PHP_MINOR_VERSION;") = "0" ] || [ $(php -r "echo PHP_MINOR_VERSION;") = "1" ]; then \
          pecl install mongodb-1.9.2; \
        else \
          pecl install mongodb-1.16.2; \
        fi; \
      else \
        pecl install mongodb; \
      fi; \
      docker-php-ext-enable mongodb; \
      php -m | grep -oiE '^mongodb$'; \
    fi; \
  fi

# Install ZipArchive:
ARG INSTALL_ZIP_ARCHIVE=false
RUN set -eux; \
  if [ ${INSTALL_ZIP_ARCHIVE} = true ]; then \
    apk --update add libzip-dev && \
    if [ ${CANTOR_PHP_VERSION} = "7.3" ] || [ ${CANTOR_PHP_VERSION} = "7.4" ]; then \
      docker-php-ext-configure zip; \
    else \
      docker-php-ext-configure zip --with-libzip; \
    fi && \
    # Install the zip extension
    docker-php-ext-install zip \
;fi

# Install MySQL Client:
ARG INSTALL_MYSQL_CLIENT=false
RUN if [ ${INSTALL_MYSQL_CLIENT} = true ]; then \
      apk --update add mysql-client \
;fi

# Install FFMPEG:
ARG INSTALL_FFMPEG=false
RUN if [ ${INSTALL_FFMPEG} = true ]; then \
    apk --update add ffmpeg \
;fi

# Install BBC Audio Waveform Image Generator:
ARG INSTALL_AUDIOWAVEFORM=false
RUN if [ ${INSTALL_AUDIOWAVEFORM} = true ]; then \
   apk add git make cmake gcc g++ libmad-dev libid3tag-dev libsndfile-dev gd-dev boost-dev libgd libpng-dev zlib-dev \
   && apk add autoconf automake libtool gettext \
   && wget https://github.com/xiph/flac/archive/1.3.3.tar.gz \
   && tar xzf 1.3.3.tar.gz \
   && cd flac-1.3.3 \
   && ./autogen.sh \
   && ./configure --enable-shared=no \
   && make \
   && make install \
   && cd .. \
   && git clone https://github.com/bbc/audiowaveform.git \
   && cd audiowaveform \
   && wget https://github.com/google/googletest/archive/release-1.10.0.tar.gz \
   && tar xzf release-1.10.0.tar.gz \
   && ln -s googletest-release-1.10.0/googletest googletest \
   && ln -s googletest-release-1.10.0/googlemock googlemock \
   && mkdir build \
   && cd build \
   && cmake .. \
   && make \
   && make install \
;fi

WORKDIR /usr/src

ARG INSTALL_GHOSTSCRIPT=false
RUN if [ $INSTALL_GHOSTSCRIPT = true ]; then \
    apk --update add ghostscript \
;fi

# Install Redis package:
ARG INSTALL_REDIS=false
RUN if [ ${INSTALL_REDIS} = true ]; then \
    # Install Redis Extension
    printf "\n" | pecl install -o -f redis \
    &&  rm -rf /tmp/pear \
    &&  docker-php-ext-enable redis \
;fi

###########################################################################
# Swoole EXTENSION
###########################################################################

ARG INSTALL_SWOOLE=false

RUN if [ ${INSTALL_SWOOLE} = true ]; then \
    # Install Php Swoole Extension
    if [ $(php -r "echo PHP_MAJOR_VERSION;") = "5" ]; then \
      pecl -q install swoole-2.0.10; \
    else \
      if [ $(php -r "echo PHP_MINOR_VERSION;") = "0" ]; then \
        pecl install swoole-2.2.0; \
      else \
        pecl install swoole; \
      fi \
    fi \
    && docker-php-ext-enable swoole \
;fi

###########################################################################
# Taint EXTENSION
###########################################################################

ARG INSTALL_TAINT=false

RUN if [ ${INSTALL_TAINT} = true ]; then \
    # Install Php TAINT Extension
    if [ $(php -r "echo PHP_MAJOR_VERSION;") = "7" ]; then \
      pecl install taint; \
    fi && \
    docker-php-ext-enable taint \
;fi

###########################################################################
# Imap EXTENSION
###########################################################################

ARG INSTALL_IMAP=false

RUN if [ ${INSTALL_IMAP} = true ]; then \
    apk add --update imap-dev openssl-dev && \
    docker-php-ext-configure imap --with-imap --with-imap-ssl && \
    docker-php-ext-install imap \
;fi

###########################################################################
# XMLRPC:
###########################################################################

ARG INSTALL_XMLRPC=false

RUN if [ ${INSTALL_XMLRPC} = true ]; then \
    docker-php-ext-install xmlrpc \
;fi

#
#--------------------------------------------------------------------------
# Optional Supervisord Configuration
#--------------------------------------------------------------------------
#
# Modify the ./supervisor.conf file to match your App's requirements.
# Make sure you rebuild your container with every change.
#

COPY supervisord.conf /etc/supervisord.conf

ENTRYPOINT ["/usr/bin/supervisord", "-n", "-c",  "/etc/supervisord.conf"]

#
#--------------------------------------------------------------------------
# Optional Software's Installation
#--------------------------------------------------------------------------
#
# If you need to modify this image, feel free to do it right here.
#
    # -- Your awesome modifications go here -- #

#
#--------------------------------------------------------------------------
# Check PHP version
#--------------------------------------------------------------------------
#

RUN php -v | head -n 1 | grep -q "PHP ${PHP_VERSION}."

#
#--------------------------------------------------------------------------
# Final Touch
#--------------------------------------------------------------------------
#

# Clean up
RUN rm /var/cache/apk/* \
    && mkdir -p /srv/services

WORKDIR /etc/supervisor/conf.d/
