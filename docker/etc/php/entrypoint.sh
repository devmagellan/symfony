#!/bin/sh
echo ' START PHP POST INSTALL SCRIPTS'

setfacl -dm u:www-data:rwX /var/www
cd /var/www
composer update
php bin/console lexik:jwt:generate-keypair --overwrite
echo ' END PHP POST INSTALL SCRIPTS'

docker-php-entrypoint $@