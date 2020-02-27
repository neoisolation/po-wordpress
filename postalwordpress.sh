#!/bin/sh
#
#
function delay()
{
    sleep 0.2;
}

#
# 
CURRENT_PROGRESS=0
function progress()
{
    PARAM_PROGRESS=$1;
    PARAM_PHASE=$2;

    if [ $CURRENT_PROGRESS -le 0 -a $PARAM_PROGRESS -ge 0 ]  ; then echo -ne "[..........................] (0%)  $PARAM_PHASE \r"  ; delay; fi;
    if [ $CURRENT_PROGRESS -le 5 -a $PARAM_PROGRESS -ge 5 ]  ; then echo -ne "[#.........................] (5%)  $PARAM_PHASE \r"  ; delay; fi;
    if [ $CURRENT_PROGRESS -le 7 -a $PARAM_PROGRESS -ge 7 ]  ; then echo -ne "[#.........................] (7%)  $PARAM_PHASE \r"  ; delay; fi;
    if [ $CURRENT_PROGRESS -le 10 -a $PARAM_PROGRESS -ge 10 ]; then echo -ne "[##........................] (10%) $PARAM_PHASE \r"  ; delay; fi;
    if [ $CURRENT_PROGRESS -le 15 -a $PARAM_PROGRESS -ge 15 ]; then echo -ne "[###.......................] (15%) $PARAM_PHASE \r"  ; delay; fi;
    if [ $CURRENT_PROGRESS -le 20 -a $PARAM_PROGRESS -ge 20 ]; then echo -ne "[####......................] (20%) $PARAM_PHASE \r"  ; delay; fi;
    if [ $CURRENT_PROGRESS -le 25 -a $PARAM_PROGRESS -ge 25 ]; then echo -ne "[#####.....................] (25%) $PARAM_PHASE \r"  ; delay; fi;
    if [ $CURRENT_PROGRESS -le 30 -a $PARAM_PROGRESS -ge 30 ]; then echo -ne "[######....................] (30%) $PARAM_PHASE \r"  ; delay; fi;
    if [ $CURRENT_PROGRESS -le 35 -a $PARAM_PROGRESS -ge 35 ]; then echo -ne "[#######...................] (35%) $PARAM_PHASE \r"  ; delay; fi;
    if [ $CURRENT_PROGRESS -le 40 -a $PARAM_PROGRESS -ge 40 ]; then echo -ne "[########..................] (40%) $PARAM_PHASE \r"  ; delay; fi;
    if [ $CURRENT_PROGRESS -le 45 -a $PARAM_PROGRESS -ge 45 ]; then echo -ne "[#########.................] (45%) $PARAM_PHASE \r"  ; delay; fi;
    if [ $CURRENT_PROGRESS -le 50 -a $PARAM_PROGRESS -ge 50 ]; then echo -ne "[##########................] (50%) $PARAM_PHASE \r"  ; delay; fi;
    if [ $CURRENT_PROGRESS -le 55 -a $PARAM_PROGRESS -ge 55 ]; then echo -ne "[###########...............] (55%) $PARAM_PHASE \r"  ; delay; fi;
    if [ $CURRENT_PROGRESS -le 60 -a $PARAM_PROGRESS -ge 60 ]; then echo -ne "[############..............] (60%) $PARAM_PHASE \r"  ; delay; fi;
    if [ $CURRENT_PROGRESS -le 65 -a $PARAM_PROGRESS -ge 65 ]; then echo -ne "[#############.............] (65%) $PARAM_PHASE \r"  ; delay; fi;
    if [ $CURRENT_PROGRESS -le 70 -a $PARAM_PROGRESS -ge 70 ]; then echo -ne "[###############...........] (70%) $PARAM_PHASE \r"  ; delay; fi;
    if [ $CURRENT_PROGRESS -le 75 -a $PARAM_PROGRESS -ge 75 ]; then echo -ne "[#################.........] (75%) $PARAM_PHASE \r"  ; delay; fi;
    if [ $CURRENT_PROGRESS -le 80 -a $PARAM_PROGRESS -ge 80 ]; then echo -ne "[####################......] (80%) $PARAM_PHASE \r"  ; delay; fi;
    if [ $CURRENT_PROGRESS -le 85 -a $PARAM_PROGRESS -ge 85 ]; then echo -ne "[#######################...] (85%) $PARAM_PHASE \r"  ; delay; fi;
    if [ $CURRENT_PROGRESS -le 90 -a $PARAM_PROGRESS -ge 90 ]; then echo -ne "[##########################] (100%) $PARAM_PHASE \r" ; delay; fi;
    if [ $CURRENT_PROGRESS -le 100 -a $PARAM_PROGRESS -ge 100 ];then echo -ne 'Postal mail server and Wordpress Setup is Completed login after your server reboot! Good luck ;)  \n' ; delay; fi;

    CURRENT_PROGRESS=$PARAM_PROGRESS;

}


#################################### DEMO ######################################

# This is a simple demostration

# Important notice: below code is not necessary in your code, remember to remove before using

################################################################################

set -e

echo "Postal webserver and Wordpress Installation is in progress, please wait a few seconds                               "
sleep 1;
#Do some tasks
progress 1 "Please wait..."
sleep 1;
progress 7 "Getting Your System Ready!"
progress 8 "Getting Your System Ready!"
progress 9 "Getting Your System Ready!"
progress 10 "Getting Your System Ready!"
progress 11 "Getting Your System Ready!"
progress 12 "Getting Your System Ready!"
progress 13 "Getting Your System Ready!"
progress 14 "Getting Your System Ready!"
progress 15 "Getting Your System Ready!"
progress 16 "Getting Your System Ready!"
progress 17 "Getting Your System Ready!"
progress 19 "Getting Your System Ready!"
sleep 1;
read -p "What is the Database Password that you want to use? (Make a Strong Password for your safety): " dbpassword
echo "Perfect!"
sleep 0.5;
read -p "What is the domain you want to use for Postal webserver and Wordpress? (example.com): " domain1
echo "https://postal.$subdomain1 for your webmail server and https://$subdomain1 for your Wordpress website, Great domain!"
sleep 1;
#Do some tasks
progress 20 "Installing Postal mail server Necessary Packages..."

#
# Dependencies
#
apt update;
apt-get install apt-transport-https;
apt install -y software-properties-common;
apt-add-repository ppa:brightbox/ruby-ng -y;
apt-key adv --recv-keys --keyserver hkp://keyserver.ubuntu.com:80 0xF1656F24C74CD1D8;
add-apt-repository 'deb [arch=amd64,i386,ppc64el] http://mirrors.coreix.net/mariadb/repo/10.1/ubuntu xenial main';
curl -sL https://www.rabbitmq.com/rabbitmq-release-signing-key.asc | apt-key add -;
add-apt-repository 'deb http://www.rabbitmq.com/debian/ testing main';
apt update;
export DEBIAN_FRONTEND=noninteractive;
apt install -y libnetcdf-dev libssl-dev libcrypto++-dev libgmp-dev ruby-mysql2 ruby2.3 ruby2.3-dev build-essential mariadb-server libmysqlclient-dev rabbitmq-server nodejs git nginx wget nano;

gem install bundler procodile --no-rdoc --no-ri;

progress 25 "Installing Msql for Postal Necessary Packages..."

#
# MySQL
#
echo 'CREATE DATABASE `postal` CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci;' | mysql -u root
echo 'GRANT ALL ON `postal`.* TO `postal`@`127.0.0.1` IDENTIFIED BY "$dbpassword";' | mysql -u root
echo 'GRANT ALL PRIVILEGES ON `postal-%` . * to `postal`@`127.0.0.1`  IDENTIFIED BY "$dbpassword";' | mysql -u root

progress 30 "Installing RabbitMQ for Postal Necessary Packages..."

#
# RabbitMQ
#
rabbitmqctl add_vhost /postal
rabbitmqctl add_user postal $dbpassword
rabbitmqctl set_permissions -p /postal postal ".*" ".*" ".*"

progress 35 "Installing System prep for Postal Necessary Packages..."

#
# System prep
#
useradd -r -m -d /opt/postal -s /bin/bash postal
setcap 'cap_net_bind_service=+ep' /usr/bin/ruby2.3

progress 45 "Installing Application Setup for Postal Necessary Packages..."

#
# Application Setup
#
sudo -i -u postal mkdir -p /opt/postal/app
wget https://postal.atech.media/packages/stable/latest.tgz -O - | sudo -u postal tar zxpv -C /opt/postal/app
ln -s /opt/postal/app/bin/postal /usr/bin/postal
postal bundle /opt/postal/vendor/bundle
postal initialize-config
sed -i -e "s/example.com/$domain1/g" /opt/postal/config/postal.yml;
postal initialize
postal start

progress 50 "Installing nginx for Postal Necessary Packages..."

#
# nginx
#
cp /opt/postal/app/resource/nginx.cfg /etc/nginx/sites-available/default
mkdir /etc/nginx/ssl/
openssl req -x509 -newkey rsa:4096 -keyout /etc/nginx/ssl/postal.key -out /etc/nginx/ssl/postal.cert -days 365 -nodes -subj "/C=GB/ST=Example1/L=Example2/O=Example3/CN=$domain1"
service nginx reload


cd /etc/systemd/system;
curl -O https://raw.githubusercontent.com/layen67/docker-postal-ubuntu/master/postal.service;
systemctl daemon-reload;
systemctl enable postal;
systemctl start postal;

progress 55 "Installing spamassassin for Postal Necessary Packages..."

apt-get -y install software-properties-common;
apt-get -y update;
apt-get -y install spamassassin;
systemctl restart spamassassin;
systemctl enable spamassassin;

progress 60 "Installing Postal configuration for Postal Necessary Packages..."

echo '' | sudo tee -a /opt/postal/config/postal.yml;
echo 'spamd:' | sudo tee -a /opt/postal/config/postal.yml;
echo '  enabled: true' | sudo tee -a /opt/postal/config/postal.yml;
echo '  host: 127.0.0.1' | sudo tee -a /opt/postal/config/postal.yml;
echo '  port: 783' | sudo tee -a /opt/postal/config/postal.yml;
# sed -i -e "s/use_ip_pools: false/use_ip_pools: true/g" /opt/postal/config/postal.yml;

echo '' | sudo tee -a /opt/postal/config/postal.yml;
echo 'smtp_server:' | sudo tee -a /opt/postal/config/postal.yml;
echo '  port: 25' | sudo tee -a /opt/postal/config/postal.yml;
echo '  tls_enabled: true' | sudo tee -a /opt/postal/config/postal.yml;
echo '  # tls_certificate_path: ' | sudo tee -a /opt/postal/config/postal.yml;
echo '  # tls_private_key_path: ' | sudo tee -a /opt/postal/config/postal.yml;
echo '  proxy_protocol: false' | sudo tee -a /opt/postal/config/postal.yml;
echo '  log_connect: true' | sudo tee -a /opt/postal/config/postal.yml;
echo '  strip_received_headers: true' | sudo tee -a /opt/postal/config/postal.yml;
sed -i -e "s/yourdomain.com/$domain1/g" /opt/postal/config/postal.yml;
sed -i -e "s/mx.postal.$domain1/postal.$domain1/g" /opt/postal/config/postal.yml;
echo 'postal.$domain1' > /etc/hostname;

progress 65 "Starting Postal mail server"

service postal start;

sed -i -e "s/yourdomain.com/$domain1/g" /etc/nginx/sites-available/default;
sed -i -e "s/80/8082/g" /etc/nginx/sites-available/default;
sed -i -e "s/443/8443/g" /etc/nginx/sites-available/default;

progress 70 "Starting nginx server"

service nginx restart;

progress 75 "Installing Docker Necessary Packages..."

#
# install docker
#


# This will install everything required to run a basic Postal installation.
# This should be run on a clean Ubuntu 16.04 server.
#
# Once the installation has completed you will be able to access the Postal web
# interface on port 443. It will have a self-signed certificate.
#
# * Change the MySQL & RabbitMQ passwords
# * Create your first admin user with 'postal make-user'
# * Replace the self-signed certificate in /etc/nginx/ssl/postal.cert
# * Make appropriate changes to the configuration in /opt/postal/config/postal.yml
# * Setup your DNS                          [ https://github.com/atech/postal/wiki/Domains-&-DNS-Configuration ]
# * Configure the click & open tracking     [ https://github.com/atech/postal/wiki/Click-&-Open-Tracking ]
# * Configure spam & virus checking         [ https://github.com/atech/postal/wiki/Spam-&-Virus-Checking ]

#
# Dependencies
#
sudo apt-get install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    software-properties-common

curl -fsSL https://yum.dockerproject.org/gpg | sudo apt-key add -

sudo add-apt-repository \
    "deb https://apt.dockerproject.org/repo/ \
    ubuntu-$(lsb_release -cs) \
    main"

progress 80 "Installing Docker-compose Necessary Packages..."

sudo apt-get update;
sudo apt-get -y install docker-engine docker-compose;

# add current user to docker group so there is no need to use sudo when running docker
sudo usermod -aG docker $(whoami)
mkdir /var/lib/docker/wordpress;

echo "
version: '2'
services:
  https-portal:
    container_name: https-portal
    image: steveltn/https-portal:latest
    ports:
      - '80:80'
      - '443:443'
    networks:
      static-network:
        ipv4_address: 172.20.128.2
    restart: always
    environment:
      STAGE: 'production'
      NUMBITS: '4096'
#        FORCE_RENEW: 'true'
      WORKER_PROCESSES: '4'
      WORKER_CONNECTIONS: '1024'
      KEEPALIVE_TIMEOUT: '65'
      GZIP: 'on'
      SERVER_NAMES_HASH_BUCKET_SIZE: '64'
      PROXY_CONNECT_TIMEOUT: '900'
      PROXY_SEND_TIMEOUT: '900'
      PROXY_READ_TIMEOUT: '900'
      CLIENT_MAX_BODY_SIZE: 300M
      DOMAINS: >-
          $domain1 -> http://172.20.128.4,
          www.$domain1 -> http://172.20.128.4,
          postal.$domain1 -> https://172.17.0.1:8443
    volumes:
      - ./conf.d:/etc/nginx/conf.d/:rw
      - ./ssl_certs:/var/lib/https-portal:rw
      - /var/run/docker.sock:/var/run/docker.sock:ro
      
  db:
    container_name: mysql57
    image: mysql:5.7
    volumes:
      - ./db_data:/var/lib/mysql
    restart: unless-stopped
    environment:
      MYSQL_ROOT_PASSWORD: $dbpassword
      MYSQL_DATABASE: wordpress
      MYSQL_USER: wordpress
      MYSQL_PASSWORD: $dbpassword
    networks:
      static-network:
        ipv4_address: 172.20.128.3

  wordpress:
    depends_on:
      - db
    image: klayen/wordpress-postal:1.00
    ports:
      - "8000:80"
    volumes:
      - ./wp_data:/var/www/html
      - ./wp-content:/var/www/html/wp-content
    restart: unless-stopped
    environment:
      WORDPRESS_DB_HOST: db:3306
      WORDPRESS_DB_USER: wordpress
      WORDPRESS_DB_PASSWORD: $dbpassword
      WORDPRESS_CONFIG_EXTRA: |
        /* Site URL */
        define('WP_HOME', 'https://$domain1');     # <-- CHANGEME
        define('WP_SITEURL', 'https://$domain1');  # <-- CHANGEME
        /* Developer friendly settings */
        # define('SCRIPT_DEBUG', true);
        # define('CONCATENATE_SCRIPTS', false);
        # define('WP_DEBUG', true);
        # define('WP_DEBUG_LOG', true);
        # define('SAVEQUERIES', true);
        /* Multisite */
        # define('WP_ALLOW_MULTISITE', true );
        # define('MULTISITE', true);
        # define('SUBDOMAIN_INSTALL', false);
        # define('DOMAIN_CURRENT_SITE', '$domain1');  # <-- CHANGEME
        # define('PATH_CURRENT_SITE', '/');
        # define('SITE_ID_CURRENT_SITE', 1);
        # define('BLOG_ID_CURRENT_SITE', 1);
    networks:
      static-network:
        ipv4_address: 172.20.128.4

networks:
  static-network:
    ipam:
      config:
        - subnet: 172.20.0.0/16
          #docker-compose v3+ do not use ip_range
          ip_range: 172.28.5.0/24
"> /var/lib/docker/wordpress/docker-compose.yml;

cd /var/lib/docker/wordpress

sed -i -r "s/.*tls_certificate_path.*/  tls_certificate_path: \/var\/lib\/docker\/wordpress\/ssl_certs\/postal.$domain1\/production\/signed.crt/g" /opt/postal/config/postal.yml;
sed -i -r "s/.*tls_private_key_path.*/  tls_private_key_path: \/var\/lib\/docker\/wordpress\/ssl_certs\/postal.$domain1\/production\/domain.key/g" /opt/postal/config/postal.yml;
sed -i -r "s/.*postal.cert.*/    ssl_certificate          \/var\/lib\/docker\/wordpress\/ssl_certs\/postal.$domain1\/production\/signed.crt;/g" /etc/nginx/sites-available/default;
sed -i -r "s/.*postal.key.*/    ssl_certificate_key      \/var\/lib\/docker\/wordpress\/ssl_certs\/postal.$domain1\/production\/domain.key;/g" /etc/nginx/sites-available/default;

progress 85 "Installing Docker configuration Necessary Packages..."

docker-compose up -d;
sleep 5
service postal restart;
sleep 5

progress 90 "Create user profile for Postal mail server";

postal make-user;

progress 100 "                                                               ";
sleep 2;
echo "##################################################################";
echo "#######   Connect to   ###########################################";
echo "#######   Mail server :       https://postal.$domain1    #########";
echo "#######   Wordpress website:  https://$domain1            ########";
echo "##################################################################";
echo "## Having Issues? Contact me at: lkbcontact@gmail.com ############";
echo "##################################################################";

reboot;
