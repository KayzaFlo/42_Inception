# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: fgeslin <fgeslin@student.42.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/01/31 13:26:56 by fgeslin           #+#    #+#              #
#    Updated: 2024/01/29 17:03:19 by fgeslin          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

#####	CONFIG		############################################################
NAME		:= Inception

#####	SOURCES		############################################################

#####	Makefile  objs		###################################################
C_WHT		:= \033[0m
C_RED		:= \033[1;31m
C_GRE		:= \033[1;32m
C_YEL		:= \033[1;33m
C_CYA 		:= \033[1;36m

# ------ #

all: compose

compose:
	docker-compose -f srcs/docker-compose.yml up --build

start:
	docker-compose -f srcs/docker-compose.yml start

nuke:
	docker system prune -af

hostname:
	echo "" >> /etc/hosts
	echo "127.0.0.1	fgeslin.42.ca" >> /etc/hosts

# ------ #

clean:
	@ docker-compose -f srcs/docker-compose.yml down
	@ echo "$(C_RED)Closing $(C_CYA)$(NAME) $(C_WHT) ✔️"

fclean: clean
	@ docker image rm srcs-wordpress
	@ docker image rm srcs-mariadb
	@ docker image rm srcs-nginx
	@ docker volume rm srcs_mariadb_vol
	@ docker volume rm srcs_wordpress_vol
	@ echo "$(C_RED)Deleting $(C_CYA)$(NAME) $(C_WHT) images & volumes ✔️"

re: fclean all

.PHONY: all clean fclean re
