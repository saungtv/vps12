#!/bin/bash
#

# install sql server 

echo "======================  sedang melakukan install sql server ... ======================"
echo "======================================================================================"

echo "......................................................................................"
echo "......................................................................................"

echo "======================================================================================"
echo "======================================================================================"

echo -en "\n\n"

cd /usr/bin
apt-get update -y
apt-get install mysql-server -y
mysql_secure_installation
chown -R mysql:mysql /var/lib/mysql/
chmod -R 755 /var/lib/mysql/
apt-get -y install nginx php5 php5-fpm 
apt-get -y install nginx php5 php5-cli 
apt-get -y install nginx php5 php5-mysql 
apt-get -y install nginx php5 php5-mcrypt
cd

echo "......................................................................................"
echo "......................................................................................"

echo "======================================================================================"
echo "======================================================================================"

echo -en "\n\n"

# install nginx dan php5

echo "===================  sedang melakukan install nginx dan php5 ... ====================="
echo "======================================================================================"

echo "......................................................................................"
echo "......................................................................................"

echo "======================================================================================"
echo "======================================================================================"

echo -en "\n\n"

cd /usr/bin
rm /etc/nginx/sites-enabled/default
rm /etc/nginx/sites-available/default
mv /etc/nginx/nginx.conf /etc/nginx/nginx.conf.backup
mv /etc/nginx/conf.d/vps.conf /etc/nginx/conf.d/vps.conf.backup
wget -O /etc/nginx/nginx.conf "https://ocs-deb8.000webhostapp.com/vpnssh/nginx.conf"
wget -O /etc/nginx/conf.d/vps.conf "https://ocs-deb8.000webhostapp.com/vpnssh/vps.conf"
sed -i 's/cgi.fix_pathinfo=1/cgi.fix_pathinfo=0/g' /etc/php5/fpm/php.ini
sed -i 's/listen = \/var\/run\/php5-fpm.sock/listen = 127.0.0.1:9000/g' /etc/php5/fpm/pool.d/www.conf
cd

echo "......................................................................................"
echo "......................................................................................"

echo "======================================================================================"
echo "======================================================================================"

echo -en "\n\n"

# install user dan akses nginx

echo "==============  sedang melakukan install user dan akses nginx ... ===================="
echo "======================================================================================"

echo "......................................................................................"
echo "......................................................................................"

echo "======================================================================================"
echo "======================================================================================"

echo -en "\n\n"

cd /usr/bin
useradd -m vps
mkdir -p /home/vps/public_html
rm /home/vps/public_html/index.html
echo "<?php phpinfo() ?>" > /home/vps/public_html/info.php
chown -R www-data:www-data /home/vps/public_html
chmod -R g+rw /home/vps/public_html
/etc/init.d/php5-fpm restart
/etc/init.d/nginx restart
cd

echo "......................................................................................"
echo "......................................................................................"

echo "======================================================================================"
echo "======================================================================================"

echo -en "\n\n"

echo "===================  silahkan setup ocs via web browser ... =========================="
echo "===========================  http://ip-vps:81/info.php ... ==========================="
echo "==================  jika sudah lanjut kan untuk setup OCS panel ... =================="
echo "======================================================================================"

echo "......................................................................................"
echo "......................................................................................"

echo "======================================================================================"
echo "======================================================================================"

echo -en "\n\n"