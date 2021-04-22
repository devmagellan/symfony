FROM php:7.4-fpm
RUN echo "Acquire::Check-Valid-Until \"false\";\nAcquire::Check-Date \"false\";" | cat > /etc/apt/apt.conf.d/10no--check-valid-until
RUN apt-get update > /dev/null && apt-get install -y \
   git \
   unzip \
   libjpeg-dev \
   libxpm-dev \
   libwebp-dev \
   libfreetype6-dev \
   libjpeg62-turbo-dev \
   libmcrypt-dev \
   libpng-dev \
   zlib1g-dev \
   libzip-dev \
   libicu-dev \
   jpegoptim \
   g++ \
   libxrender1 \
   libfontconfig \
   libxml2-dev \
   libxslt-dev \
   libicu-dev \
   nano \
   cron \
   wget \
   acl \
   libldap2-dev

RUN docker-php-ext-configure intl \
   && docker-php-ext-install intl > /dev/null \
   && docker-php-ext-install zip > /dev/null \
   && docker-php-ext-install bcmath > /dev/null \
   && docker-php-ext-install gd > /dev/null \
   && docker-php-ext-install dom > /dev/null\
	&& docker-php-ext-install	xmlrpc > /dev/null\
    && docker-php-ext-install  xml > /dev/null\
	&& docker-php-ext-install	xsl > /dev/null \
	    && docker-php-ext-install mysqli > /dev/null \
	    && docker-php-ext-install pdo > /dev/null \
	    && docker-php-ext-install pdo_mysql > /dev/null \
      && docker-php-ext-enable mysqli
RUN pecl install xdebug-2.8.1 \
    && docker-php-ext-enable xdebug
RUN pecl install -o -f redis \
    && docker-php-ext-enable redis
RUN pecl install mcrypt-1.0.3 \
   && docker-php-ext-enable mcrypt
# Install Composer
#RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer > /dev/null
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer
RUN usermod -u 1000 www-data
RUN chown -R www-data:1000 /var/www
RUN set -eux; \
        mkdir -p /var/www/var/cache /var/www/var/log /var/www/var/sessions/dev
RUN chmod -R 777 /var/www/var/sessions/dev
RUN chmod -R 777 /var/www
RUN chown -R www-data /var/www

RUN mkdir -p /var/www/config/jwt
RUN chmod -R 777 /var/www/config/jwt
USER www-data

WORKDIR /var/www
ENTRYPOINT ["entrypoint.sh"]

