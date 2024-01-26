FROM	debian:buster

RUN		apt update
RUN		apt -y upgrade
RUN		apt-get -y install wget

RUN		apt-get install -y php7.3 \
		php-fpm \
		php-mysql \
		mariadb-client
COPY	conf/www.conf /etc/php/7.3/fpm/pool.d/www.conf
RUN		mkdir /run/php

# RUN		wget https://wordpress.org/wordpress-6.3.1.tar.gz -P /var/www
# RUN		cd /var/www && tar -xzf wordpress-6.3.1.tar.gz && rm wordpress-6.3.1.tar.gz
# RUN		chown -R root:root /var/www/wordpress

RUN		wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN		chmod +x wp-cli.phar
RUN		mv wp-cli.phar /usr/local/bin/wp

COPY	conf/auto_config.sh /auto_config.sh 
RUN		chmod +x auto_config.sh
ENTRYPOINT [ "/auto_config.sh" ]

#We go the html directory
WORKDIR /var/www/html/

EXPOSE	9000

CMD ["/usr/sbin/php-fpm7.3", "-F"]
