#! /usr/bin/env bash
pass=$(grep -m 1 'password' /etc/mysql/debian.cnf | awk '{print $3}')
(/usr/bin/mysqld_safe &); sleep 3; echo '\n' && mysql -u root -proot -e "GRANT ALL PRIVILEGES ON *.* TO 'debian-sys-maint'@'localhost' IDENTIFIED BY '${pass}'"
service apache2 start


