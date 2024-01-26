FROM	debian:buster

RUN		apt update
RUN		apt upgrade -y
RUN		apt install nginx -y

# SSL
RUN		mkdir -p /etc/nginx/ssl
RUN		apt install openssl -y
RUN		openssl req \
		# certificat type
		-x509 \
		# avoid password prompt
		-nodes \
		# crtif path
		-out /etc/nginx/ssl/inception.crt \
		# key path
		-keyout /etc/nginx/ssl/inception.key \
		# auto fill prompt
		-subj "/C=CA/ST=QC/L=Québec/O=42QC/OU=42/CN=fgeslin.42.fr/UID=fgeslin"

# Config
RUN		mkdir -p /var/run/nginx
COPY	conf/nginx.conf /etc/nginx/nginx.conf

# main root
RUN chmod 755 /var/www/html
# main user
RUN chown -R www-data:www-data /var/www/html

CMD [ "nginx", "-g", "daemon off;" ]
