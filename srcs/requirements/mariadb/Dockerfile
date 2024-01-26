FROM	debian:buster

RUN		apt update
RUN		apt upgrade -y
RUN		apt-get install mariadb-server -y
RUN		apt-get install mariadb-client -y

RUN mkdir -p /var/run/mysqld \
&& chown -R mysql:mysql /var/run/mysqld \
&& chmod 777 /var/run/mysqld

EXPOSE 3306

COPY	conf/50-server.cnf	/etc/mysql/mariadb.conf.d/50-server.cnf

# COPY	tools/TableCreation.sh	/TableCreation.sh
# RUN		chmod 755 /TableCreation.sh
# ENTRYPOINT [ "/TableCreation.sh" ]

COPY	tools/mariadb.sh /mariadb.sh
RUN		chmod 755 /mariadb.sh
ENTRYPOINT [ "/mariadb.sh" ]

CMD ["mysqld_safe", "--bind-address=0.0.0.0"]
