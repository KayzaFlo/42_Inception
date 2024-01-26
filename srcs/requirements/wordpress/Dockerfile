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

RUN		wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN		chmod +x wp-cli.phar
RUN		mv wp-cli.phar /usr/local/bin/wp

COPY	tools/wordpress.sh /wordpress.sh 
RUN		chmod +x wordpress.sh
ENTRYPOINT [ "/wordpress.sh" ]

#We go the html directory
WORKDIR /var/www/html/

EXPOSE	9000

CMD ["/usr/sbin/php-fpm7.3", "-F"]
