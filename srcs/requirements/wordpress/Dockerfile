FROM alpine:3.18

ARG PHP_VERSION=82

RUN apk update && apk upgrade && apk add --no-cache \
	libcurl \
	musl \
	php${PHP_VERSION} \
	php${PHP_VERSION}-common \
	php${PHP_VERSION}-fpm \
	php${PHP_VERSION}-mysqli \
	php${PHP_VERSION}-json \
	php${PHP_VERSION}-curl \
	php${PHP_VERSION}-dom \
	php${PHP_VERSION}-exif \
	php${PHP_VERSION}-fileinfo \
	php${PHP_VERSION}-mbstring \
	php${PHP_VERSION}-openssl \
	php${PHP_VERSION}-xml \
	php${PHP_VERSION}-zip \
	php${PHP_VERSION}-pecl-igbinary \
	php${PHP_VERSION}-pecl-imagick \
	php${PHP_VERSION}-intl \
	php${PHP_VERSION}-redis \
	php${PHP_VERSION}-phar \
	php${PHP_VERSION}-curl \
	curl \	
	mariadb-client \
	wget \
	unzip && \
    	sed -i "s|listen = 127.0.0.1:9000|listen = 9000|g" \
    		/etc/php82/php-fpm.d/www.conf && \
    	sed -i "s|;listen.owner = nobody|listen.owner = nobody|g" \
    		/etc/php82/php-fpm.d/www.conf && \
    	sed -i "s|;listen.group = nobody|listen.group = nobody|g" \
    		/etc/php82/php-fpm.d/www.conf && \
    	rm -f /var/cache/apk/*

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
	chmod +x wp-cli.phar && \
	mv wp-cli.phar /usr/local/bin/wp && \
	ln -s /usr/bin/php82 /usr/bin/php

WORKDIR /var/www

RUN wget https://wordpress.org/latest.zip && \
    unzip latest.zip && \
    cp -rf wordpress/* . && \
    rm -rf wordpress latest.zip && \
    rm wp-config-sample.php

COPY ./requirements/wordpress/conf/wp-config.php .
COPY ./requirements/wordpress/tools/wp-setup.sh .

RUN chmod +x wp-setup.sh && chmod -R 0777 wp-content/

ENTRYPOINT ["sh", "wp-setup.sh"]
#CMD ["/usr/sbin/php-fpm82", "-F"]
