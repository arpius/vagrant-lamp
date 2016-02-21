#!/bin/bash

# Actualizar servidor
yum update -y

# Instalar herramientas de desarrollo
yum groupinstall 'Development Tools' -y

# Instalar Apache
yum install httpd -y
service httpd start

# Instalar PHP
yum install php php-mysql php-cli php-mcrypt -y

# Instalar MySQL
yum install mysql-server -y
service mysqld start
mysqladmin -u root password 'root'

# Agregar repositorio EPEL
yum install epel-release -y

# Instalar PhpMyAdmin
yum install phpMyAdmin -y

# Configurar phpMyAdmin
# Sustituir las IPs de localhost por las de mi equipo
# Comentar todos las líneas que contengan 'deny from all'
sed -i 's/127.0.0.1/192.168.1.99/g' /etc/httpd/conf.d/phpMyAdmin.conf
sed -i 's/Deny from All/# Deny from All/g' /etc/httpd/conf.d/phpMyAdmin.conf

# Instalar Composer
curl -sS https://getcomposer.org/installer | php
mv composer.phar /usr/local/bin/composer

# Abrir los puertos 22, 80 y 443 en iptables
/sbin/iptables -I INPUT -p tcp --dport 22 -j ACCEPT
/sbin/iptables -I INPUT -p tcp --dport 80 -j ACCEPT
/sbin/iptables -I INPUT -p tcp --dport 443 -j ACCEPT
/etc/rc.d/init.d/iptables save

# Inicio automático de Apache y MySQL
chkconfig httpd on
chkconfig mysqld on

# Reiniciar el servicio de Apache
service httpd restart
