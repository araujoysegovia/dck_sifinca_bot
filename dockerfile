FROM php:7.3.27-fpm

RUN apt-get update 
RUN apt-get install -y libpq-dev git --no-install-recommends \
    libmcrypt-dev openssl zip unzip curl apt-utils wget


RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --1 --filename=composer

RUN docker-php-ext-install pdo mbstring

RUN echo 'memory_limit=-1' >> /usr/local/etc/php/conf.d/php-memlimit.ini

RUN apt-get clean && rm -rf /var/lib/apt/lists/*

