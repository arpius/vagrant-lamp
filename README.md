Vagrant LAMP
============
Este repositorio contiene la configuración para poder levantar una máquina que contenga:

- Centos
- Apache
- PHP
- MySQL
- PhpMyAdmin

##Requisitos

- [VirtualBox](https://www.virtualbox.org/wiki/Downloads)
- [Vagrant](https://www.vagrantup.com/)
- [Git](https://git-scm.com/)

##Forma de uso

	$ git clone https://github.com/arpius/vagrant-lamp.git
	$ cd Vagrant-LAMP
	$ vagrant up

####Acceso al servidor web
- URL: http://localhost:8080

####MySQL y PhpMyAdmin
- Usuario: root
- Contraseña: root
- PhpMyAdmin URL: http://localhost:8080/phpmyadmin

####Web root
La carpeta htdocs enlaza a la raíz del proyecto (/var/www/html).

##Licencia
Este proyecto tiene una licencia <a href="https://github.com/arpius/vagrant-lamp/blob/master/LICENSE">Apache</a>.
