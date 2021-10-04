FROM php:8.0-fpm

RUN ln -sf /usr/share/zoneinfo/Europe/Samara /etc/localtime

RUN apt-get update \
&& apt-get install -y git \
                      cron \
                      zlib1g-dev \
                      libfreetype6-dev \
                      openssl \
                      libpq-dev \
    				  unzip \
    				   vim \
                      nano \
    				  wget \
                      libzip-dev \
                      libpng-dev \
&& docker-php-ext-install pdo \
						  pgsql \
						  pdo_pgsql \
						  zip \
						  bcmath \
						  gd \
						  tokenizer \
						  exif \
&& curl -sS https://getcomposer.org/installer | php && mv composer.phar /usr/local/bin/composer

RUN pecl install xdebug && docker-php-ext-enable xdebug

WORKDIR /var/www/html

RUN usermod -u 1000 www-data
RUN chown -R www-data:www-data /var/www/html

EXPOSE 9000
