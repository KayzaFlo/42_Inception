#!/bin/bash

# Reset
Reset='\033[0m'       # Text Reset

# Regular Colors
Black='\033[0;30m'        # Black
Red='\033[0;31m'          # Red
Green='\033[0;32m'        # Green
Yellow='\033[0;33m'       # Yellow
Blue='\033[0;34m'         # Blue
Purple='\033[0;35m'       # Purple
Cyan='\033[0;36m'         # Cyan
White='\033[0;37m'        # White

ENV_PATH="srcs/.env"

echo -e -n "" > "${ENV_PATH}"

while [ -z "$domaineNamePrompt" ];
do
    echo -e -n "${Yellow}Please enter the domaine name: ${Reset}"
    read domaineNamePrompt
done
echo -e "DOMAIN_NAME=${domaineNamePrompt}" >> "${ENV_PATH}"



echo -e "\n# MYSQL SETUP\n" >> "${ENV_PATH}"

while [ -z "$dataBaseNamePrompt" ];
do
    echo -e -n "${Blue}Please enter the database name: ${Reset}"
    read dataBaseNamePrompt
done
echo -e "MYSQL_DATABASE=${dataBaseNamePrompt}" >> "${ENV_PATH}"

while [ -z "$dataBaseUserPrompt" ];
do
    echo -e -n "${Blue}Please enter your db user name: ${Reset}"
    read dataBaseUserPrompt
done
echo -e "MYSQL_USER=${dataBaseUserPrompt}" >> "${ENV_PATH}"

while [ -z "$dataBasePasswordPrompt" ];
do
    echo -e -n "${Blue}Please enter your db user password: ${Reset}"
    read dataBasePasswordPrompt
done
echo -e "MYSQL_PASSWORD=${dataBasePasswordPrompt}" >> "${ENV_PATH}"

while [ -z "$dataBaseRootPasswordPrompt" ];
do
    echo -e -n "${Blue}Please enter your db root password: ${Reset}"
    read dataBaseRootPasswordPrompt
done
echo -e "MYSQL_ROOT_PASSWORD=${dataBaseRootPasswordPrompt}" >> "${ENV_PATH}"



echo -e "\n# WORDPRESS\n" >> "${ENV_PATH}"

while [ -z "$wpAdminNamePrompt" ];
do
    echo -e -n "${Green}Please enter your wordpress admin name: ${Reset}"
    read wpAdminNamePrompt
done
echo -e "WP_ADMIN_NAME=${wpAdminNamePrompt}" >> "${ENV_PATH}"

while [ -z "$wpAdminEmailPrompt" ];
do
    echo -e -n "${Green}Please enter your wordpress admin email: ${Reset}"
    read wpAdminEmailPrompt
done
echo -e "WP_ADMIN_EMAIL=${wpAdminEmailPrompt}" >> "${ENV_PATH}"

while [ -z "$wpAdminPasswordPrompt" ];
do
    echo -e -n "${Green}Please enter your wordpress admin password: ${Reset}"
    read wpAdminPasswordPrompt
done
echo -e "WP_ADMIN_PASSWORD=${wpAdminPasswordPrompt}" >> "${ENV_PATH}"

echo -e "" >> "${ENV_PATH}"

while [ -z "$wpUserNamePrompt" ];
do
    echo -e -n "${Green}Please enter your wordpress user name: ${Reset}"
    read wpUserNamePrompt
done
echo -e "WP_USER_NAME=${wpUserNamePrompt}" >> "${ENV_PATH}"

while [ -z "$wpUserEmailPrompt" ];
do
    echo -e -n "${Green}Please enter your wordpress user email: ${Reset}"
    read wpUserEmailPrompt
done
echo -e "WP_USER_EMAIL=${wpUserEmailPrompt}" >> "${ENV_PATH}"

while [ -z "$wpUserPasswordPrompt" ];
do
    echo -e -n "${Green}Please enter your wordpress user password: ${Reset}"
    read wpUserPasswordPrompt
done
echo -e "WP_USER_PASSWORD=${wpUserPasswordPrompt}" >> "${ENV_PATH}"

