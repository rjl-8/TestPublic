# 2024 version

# db stuff
# create mysql db
# Specify username
#    GDAdmin
# Specify master db name
#    GDMaster
# Identify your database
#    GenericData



# General app updates
#####################
sudo apt-get update
sudo apt-get -y upgrade
# end General app updates
#########################

# Apache
########
# install apache
sudo apt-get install apache2

# install php
sudo apt-get install software-properties-common
sudo add-apt-repository ppa:ondrej/php
sudo apt-get update -y
sudo apt install php8.0 php8.0-{fpm,mysql,curl,gd,mbstring,mysql,xml,mcrypt,zip,ldap} libapache2-mod-php8.0 -y

# Apache performance improvements
sudo a2enmod proxy_fcgi setenvif
sudo a2enconf php8.0-fpm
sudo a2dismod php8.0
sudo systemctl enable php8.0-fpm
sudo service apache2 restart;sudo service php8.0-fpm restart

# Install mariadb (a fork of mysql)
sudo apt install mariadb-server -y

# permissions
sudo usermod -a -G www-data ubuntu

sudo chown -R ubuntu:www-data /var/www
sudo chmod 2775 /var/www
find /var/www -type d -exec sudo chmod 2775 {} \;
find /var/www -type f -exec sudo chmod 0664 {} \;

# root is /var/www/html

# end Apache
############

# git
#####
sudo apt-get install git -y

git clone https://github.com/rjl-8/Convert-GoDaddy-to-AWS.git

# php
mkdir /var/www/html/stocks
mkdir /var/www/html/js
cp Convert-GoDaddy-to-AWS/web/stocks/* /var/www/html/stocks
cp Convert-GoDaddy-to-AWS/web/js/* /var/www/html/js
cp Convert-GoDaddy-to-AWS/web/* /var/www/html/

# db
./Convert-GoDaddy-to-AWS/db/stocks/setup_stocks.sh

# end git
#########

# Install mysql client
#sudo apt-get install mysql-client-core-8.0 -y
