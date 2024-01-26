#!/bin/sh

mysql_install_db

# Check if the database exists

if [ -d "/var/lib/mysql/$MYSQL_DATABASE" ]
then 

	echo "Database already exists"
else
	/etc/init.d/mysql start

	echo "GRANT ALL ON *.* TO 'root'@'%' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD'; FLUSH PRIVILEGES;" | mysql -uroot

	echo "CREATE DATABASE IF NOT EXISTS $MYSQL_DATABASE;" | mysql -u root
	echo "GRANT ALL PRIVILEGES ON $MYSQL_DATABASE.* TO '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD'; " | mysql -u root
	echo "FLUSH PRIVILEGES;" | mysql -u root

	mysqladmin -u root -p$SQL_ROOT_PASSWORD shutdown
fi


exec "$@"