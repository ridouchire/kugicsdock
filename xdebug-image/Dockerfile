FROM library/php:7.0-fpm
LABEL MAINTANER kugimiya <bp.001@yandex.ru>

RUN apt update -yyq && apt install -yyq mysql-client xz-utils

RUN apt-get update && apt-get install -y \
        libfreetype6-dev \
        libjpeg62-turbo-dev \
        libmcrypt-dev \
        libpng-dev \
    && docker-php-ext-install -j$(nproc) iconv mcrypt \
    && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
    && docker-php-ext-install -j$(nproc) gd

RUN docker-php-ext-install mysqli

RUN pecl install xdebug-2.6.0 && \
    echo "zend_extension=$(ls -1 /usr/local/lib/php/extensions/*/xdebug.so)" > /usr/local/etc/php/conf.d/xdebug.ini

RUN docker-php-ext-enable mysqli xdebug

ADD php-fpm.sh /php-fpm.sh

RUN chmod +x /php-fpm.sh

CMD ["/php-fpm.sh"]
