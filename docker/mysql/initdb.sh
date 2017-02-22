#! /bin/bash
# Copyright 2017 Luis Miguel Mejía Suárez (BalmungSan)
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#  http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

mysql -u root -p$MYSQL_ROOT_PASSWORD -e "CREATE DATABASE bookstore;"
mysql -u root -p$MYSQL_ROOT_PASSWORD -e "GRANT ALL PRIVILEGES ON bookstore.* TO 'bookstore'@'localhost' IDENTIFIED BY 'bookstore';"
mysql -u root -p$MYSQL_ROOT_PASSWORD -e "GRANT ALL PRIVILEGES ON bookstore.* TO 'bookstore'@'$APACHE_HOSTS' IDENTIFIED BY 'bookstore';"
mysql -u root -p$MYSQL_ROOT_PASSWORD -e "FLUSH PRIVILEGES;"
mysql -u bookstore -pbookstore bookstore < /home/bookstore/bookstore.sql
mysql -u bookstore -pbookstore bookstore < /home/bookstore/data.sql