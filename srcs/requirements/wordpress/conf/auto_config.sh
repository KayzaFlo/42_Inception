#!/bin/bash

# wait for mariadb initialized
# sleep 10

if [ -f ./wp-config.php ]
then
	echo "wordpress already downloaded"
else

	#Download wordpress and all config file
	wget http://wordpress.org/latest.tar.gz
	tar xfz latest.tar.gz
	mv wordpress/* .
	rm -rf latest.tar.gz
	rm -rf wordpress

	wp config create	--allow-root \
						--dbname=$MYSQL_DATABASE \
						--dbuser=$MYSQL_USER \
						--dbpass=$MYSQL_PASSWORD \
						--dbhost=mariadb:3306 \
						--path='/var/www/html'

	wp core install		--allow-root \
						--url=fgeslin.com \
						--title=Inception \
						--admin_user=root \
						--admin_password=root \
						--admin_email=root@gmail.com \
						--path='/var/www/html'

	wp user create		--allow-root \
						fgeslin flo.ges.8@gmail.com \
						--role=author \
						--path='/var/www/html'
fi

# if [ ! -d "/run/php" ]; then
# 	mkdir /run/php
# fi

# /usr/sbin/php-fpm8.2 -F




#check if wp-config.php exist
# if [ -f ./wp-config.php ]
# then
# 	echo "wordpress already downloaded"
# else

# ####### MANDATORY PART ##########

# 	#Download wordpress and all config file
# 	wget http://wordpress.org/latest.tar.gz
# 	tar xfz latest.tar.gz
# 	mv wordpress/* .
# 	rm -rf latest.tar.gz
# 	rm -rf wordpress

# 	#Inport env variables in the config file
# 	sed -i "s/username_here/$MYSQL_USER/g" wp-config-sample.php
# 	sed -i "s/password_here/$MYSQL_PASSWORD/g" wp-config-sample.php
# 	sed -i "s/localhost/$MYSQL_HOSTNAME/g" wp-config-sample.php
# 	sed -i "s/database_name_here/$MYSQL_DATABASE/g" wp-config-sample.php
# 	cp wp-config-sample.php wp-config.php
# ###################################

# fi

exec "$@"