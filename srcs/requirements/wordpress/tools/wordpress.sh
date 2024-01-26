#!/bin/bash

# wait for mariadb initialized
# sleep 10

if [ -f ./wp-config.php ]
then
	echo "✅ Volume already setuped"
else
	#Download wordpress and all config file
	echo "🔧 Downloading files..."
	wget http://wordpress.org/latest.tar.gz --no-verbose
	echo "🔧 Unziping files..."
	tar xfz latest.tar.gz
	mv wordpress/* .
	rm -rf latest.tar.gz
	rm -rf wordpress
	echo "✅ Files ready"

	wp config create	--allow-root \
						--dbname=$MYSQL_DATABASE \
						--dbuser=$MYSQL_USER \
						--dbpass=$MYSQL_PASSWORD \
						--dbhost=mariadb:3306 \
						--path='/var/www/html'

	wp core install		--allow-root \
						--url=$DOMAIN_NAME \
						--title=Inception \
						--admin_user=$WP_ADMIN_NAME \
						--admin_password=$WP_ADMIN_PASSWORD \
						--admin_email=$WP_ADMIN_EMAIL \
						--path='/var/www/html'

	wp user create		--allow-root \
						$WP_USER_NAME $WP_USER_EMAIL \
						--role=author \
						--path='/var/www/html'
	echo "✅ Sucess: User created successfully"
fi

echo "------------------------------"
echo ""
echo "Website launched at:"
echo "https://$DOMAIN_NAME"
echo ""
echo "------------------------------"

exec "$@"