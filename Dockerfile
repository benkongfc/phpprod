from php:5.6-apache
RUN a2enmod rewrite headers && \
apt-get update && \
apt-get install -y libpng-dev libjpeg-dev libfreetype6-dev libz-dev libmemcached-dev libmemcached11 libmemcachedutil2 && \
docker-php-ext-install mysql mysqli opcache && \
docker-php-ext-configure gd --with-jpeg-dir --with-freetype-dir && \
docker-php-ext-install gd && \
pecl install memcache && \
echo opcache.enable=1 > /usr/local/etc/php/conf.d/opcache-recommended.ini && \
echo opcache.revalidate_freq=2 >> /usr/local/etc/php/conf.d/opcache-recommended.ini && \
echo opcache.validate_timestamps=1 >> /usr/local/etc/php/conf.d/opcache-recommended.ini && \
echo extension=memcache.so >> /usr/local/etc/php/conf.d/memcache.ini && \
echo display_errors = Off > /usr/local/etc/php/php.ini && \
echo log_errors = On >> /usr/local/etc/php/php.ini && \
echo error_log = /dev/stderr >> /usr/local/etc/php/php.ini && \
a2enmod ssl
