# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: fgeslin <fgeslin@student.42.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/01/31 13:26:56 by fgeslin           #+#    #+#              #
#    Updated: 2024/01/24 16:23:30 by fgeslin          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

#####	CONFIG		############################################################
NGINX		:= 42_nginx
MARIADB		:= 42_mariadb
WORDPRESS	:= 42_wordpress
VERSION		:= 0.1.0

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
	docker compose -f srcs/docker-compose.yml up --build

start:
	docker compose -f srcs/docker-compose.yml start

del:
	docker compose -f srcs/docker-compose.yml down

nuke:
	docker system prune -af

$(NGINX):
	@ echo "$(C_GRE)Building ${C_WHT}of ${C_CYA}$(NGINX) ${C_WHT}..."
	@ docker build -t $(NGINX):$(VERSION) srcs/requirements/nginx
	@ echo "$(C_GRE)Running & Compiling ${C_WHT}..."
	@ docker run --detach --publish 80:80 --name $(NGINX) $(NGINX):$(VERSION)
#	@ docker run --detach --name $(NGINX) $(NGINX):$(VERSION)
	@ echo "$(C_CYA)$(NGINX) $(C_GRE)created$(C_WHT) ✔️"
	@ echo "$(C_CYA)-------------------------------------$(C_WHT)"
	@ echo "$(C_CYA)--$(C_WHT) nginx up at http://localhost:80 $(C_CYA)--$(C_WHT)"
	@ echo "$(C_CYA)-------------------------------------$(C_WHT)"

$(NGINX)_exec:
	@ docker exec -it $(NGINX) sh

$(MARIADB):
	@ echo "$(C_GRE)Building ${C_WHT}of ${C_CYA}$(MARIADB) ${C_WHT}..."
	@ docker build -t $(MARIADB):$(VERSION) srcs/requirements/mariadb
	@ echo "$(C_GRE)Running & Compiling ${C_WHT}..."
	@ docker run -it --name $(MARIADB) $(MARIADB):$(VERSION)
#	@ docker run -d --publish 3306:3306 --name $(MARIADB) $(MARIADB):$(VERSION)
	@ echo "$(C_CYA)$(BUILD) $(C_GRE)created$(C_WHT) ✔️"
	
$(MARIADB)_exec:
	@ docker exec -it $(MARIADB) sh

$(WORDPRESS):
	@ echo "$(C_GRE)Building ${C_WHT}of ${C_CYA}$(WORDPRESS) ${C_WHT}..."
	@ docker build -t $(WORDPRESS):$(VERSION) srcs/requirements/wordpress
	@ echo "$(C_GRE)Running & Compiling ${C_WHT}..."
	@ docker run -it --publish 3000:3000 --name $(WORDPRESS) $(WORDPRESS):$(VERSION)
#	@ docker run -it --name $(WORDPRESS) $(WORDPRESS):$(VERSION)
	@ echo "$(C_CYA)$(BUILD) $(C_GRE)created$(C_WHT) ✔️"

$(WORDPRESS)_exec:
	@ docker exec -it $(WORDPRESS) sh

# ------ #

clean:
#	@ docker system prune -y
#	@ docker container rm -f $(NGINX)
#	@ docker image rm -f $(NGINX):$(VERSION)
#	@ docker container rm -f $(MARIADB)
#	@ docker image rm -f $(MARIADB):$(VERSION)
#	@ docker container rm -f $(WORDPRESS)
#	@ docker image rm -f $(WORDPRESS):$(VERSION)
	@ docker image rm -f srcs-wordpress
	@ docker image rm -f srcs-mariadb
	@ docker image rm -f srcs-nginx
	@ docker volume rm -f srcs_mariadb
	@ docker volume rm -f srcs_wordpress
	@ echo "$(C_RED)Deleting $(C_CYA)$(NAME) $(C_WHT)images & containers ✔️"

fclean: clean
	@ echo "$(C_RED)Deleting $(C_CYA)$(NAME) $(C_WHT)everything ✔️"

re: fclean all

.PHONY: all clean fclean re
