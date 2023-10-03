# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: fgeslin <fgeslin@student.42.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/01/31 13:26:56 by fgeslin           #+#    #+#              #
#    Updated: 2023/10/03 14:40:09 by fgeslin          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

#####	CONFIG		############################################################
NGINX		:= nginx
MARIADB		:= mariadb
WORDPRESS	:= wordpress

#####	SOURCES		############################################################

#####	Makefile  objs		###################################################
C_WHT		:= \033[0m
C_RED		:= \033[1;31m
C_GRE		:= \033[1;32m
C_YEL		:= \033[1;33m
C_CYA 		:= \033[1;36m

# ------ #

all: $(NGINX)

$(NGINX):
	@ echo "$(C_GRE)Building ${C_WHT}of ${C_CYA}$(NGINX) ${C_WHT}..."
	@ docker build -t $(NGINX)_img srcs/requirements/nginx
	@ echo "$(C_GRE)Running & Compiling ${C_WHT}..."
	@ docker run -it --name $(NGINX)_cont $(NGINX)_img
	@ echo "$(C_CYA)$(BUILD) $(C_GRE)created$(C_WHT) ✔️"
	
$(MARIADB):
	@ echo "$(C_GRE)Building ${C_WHT}of ${C_CYA}$(MARIADB) ${C_WHT}..."
	@ docker build -t $(MARIADB)_img srcs/requirements/MARIADB
	@ echo "$(C_GRE)Running & Compiling ${C_WHT}..."
	@ docker run -it --name $(MARIADB)_cont $(MARIADB)_img
	@ echo "$(C_CYA)$(BUILD) $(C_GRE)created$(C_WHT) ✔️"
	
$(WORDPRESS):
	@ echo "$(C_GRE)Building ${C_WHT}of ${C_CYA}$(WORDPRESS) ${C_WHT}..."
	@ docker build -t $(WORDPRESS)_img srcs/requirements/WORDPRESS
	@ echo "$(C_GRE)Running & Compiling ${C_WHT}..."
	@ docker run -it --name $(WORDPRESS)_cont $(WORDPRESS)_img
	@ echo "$(C_CYA)$(BUILD) $(C_GRE)created$(C_WHT) ✔️"

# ------ #

clean:
	@ docker container rm -f $(NGINX)_cont
	@ docker image rm -f $(NGINX)_img
	@ docker container rm -f $(MARIADB)_cont
	@ docker image rm -f $(MARIADB)_img
	@ docker container rm -f $(WORDPRESS)_cont
	@ docker image rm -f $(WORDPRESS)_img
	@ echo "$(C_RED)Deleting $(C_CYA)$(NAME) $(C_WHT)images & containers ✔️"

fclean: clean
	@ echo "$(C_RED)Deleting $(C_CYA)$(NAME) $(C_WHT)everything ✔️"

re: fclean all

.PHONY: all clean fclean re


#### NOTES ####
#
#docker build [path]
#-t [name] # rajoute un nom
#
#docker image ls # voir les images
#
#docker run [image_name]
#-it # ouvre le terminal du container au lancement
#
####       ####
#
#docker build -t nginx srcs/requirements/nginx