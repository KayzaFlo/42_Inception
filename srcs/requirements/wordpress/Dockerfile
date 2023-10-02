FROM	debian:bookworm

RUN		apt update
RUN		apt -y upgrade
RUN		apt-get -y install wget

RUN		apt-get install -y php8.2 \
		php-fpm \
		php-mysql \
		mariadb-client
RUN		wget https://wordpress.org/wordpress-6.3.1.tar.gz -P /var/www
RUN		cd /var/www && tar -xzf wordpress-6.3.1.tar.gz && rm wordpress-6.3.1.tar.gz
RUN		chown -R root:root /var/www/wordpress