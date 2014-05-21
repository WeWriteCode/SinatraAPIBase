#!/usr/bin/env bash

echo "CREATE USER 'username'@'localhost' IDENTIFIED BY 'password'" | mysql -uroot -pvagrant
echo "CREATE DATABASE database" | mysql -uroot -pvagrant
echo "GRANT ALL ON database.* TO 'username'@'localhost'" | mysql -uroot -pvagrant
echo "FLUSH PRIVILEGES" | mysql -uroot -pvagrant

cd /vagrant && bundle install