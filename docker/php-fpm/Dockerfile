FROM php:8.1-fpm-alpine

# Add PHP-user
ARG GID
ARG UID

ENV UID=${UID}
ENV GID=${GID}

COPY --from=composer:latest /usr/bin/composer /usr/local/bin/composer

RUN addgroup -g ${GID} --system laravel
RUN adduser -G laravel --system -D -s /bin/sh -u ${UID} laravel

RUN sed -i "s/user = www-data/user = laravel/g" /usr/local/etc/php-fpm.d/www.conf
RUN sed -i "s/group = www-data/group = laravel/g" /usr/local/etc/php-fpm.d/www.conf
RUN echo "php_admin_flag[log_errors] = on" >> /usr/local/etc/php-fpm.d/www.conf

WORKDIR "/"

RUN apk add --no-cache \
#      php8-ctype \
#      php8-curl \
#      php8-dom \
#      php8-fileinfo \
#      php-json \
#      php8-mbstring \
#      php8-openssl \
#      pcre \
#      php8-pdo \
#      php8-tokenizer \
#      php8-xml \
      freetype \
      libjpeg-turbo \
      libpng \
      freetype-dev \
      libpq-dev \
      libjpeg-turbo-dev \
      libpng-dev \
    && docker-php-ext-configure gd \
      --with-freetype=/usr/include/ \
      # --with-png=/usr/include/ \ # No longer necessary as of 7.4; https://github.com/docker-library/php/pull/910#issuecomment-559383597
      --with-jpeg=/usr/include/ \
    && docker-php-ext-install -j$(nproc) gd \
    && docker-php-ext-enable gd \
    && apk del --no-cache \
      freetype-dev \
      libjpeg-turbo-dev \
      libpng-dev \
    && rm -rf /tmp/*

RUN apk add libzip-dev

RUN docker-php-ext-install pdo pdo_pgsql zip bcmath
RUN docker-php-ext-enable pdo pdo_pgsql

#ENV COMPOSER_ALLOW_SUPERUSER 1

# Install composer

#RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/bin --filename=composer --quiet


#RUN chown -R www-data:www-data /var/www

RUN apk add  supervisor && \
    rm -rf /var/cache/apk/* \

USER laravel

#USER $UID
#COPY --chown=$UID:$GID . .
#RUN composer install && \
   # php artisan storage:link


WORKDIR "/var/www"
#USER www-data
#ctype curl dom fileinfo json mbstring openssl pcre pdo tokenizer xml
