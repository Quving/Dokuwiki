#Update & Upgrade Ubuntu.
apt-get update && apt-get upgrade -y

#Install Apache2 and PHP.
apt-get install -y wget apache2 libapache2-mod-php7.0 php7.0-xml

#Enable Apache Rewrite module.
a2enmod rewrite

# Download and uncompress the latest stable release.
cd /var/www
wget https://download.dokuwiki.org/src/dokuwiki/dokuwiki-stable.tgz
tar xvf dokuwiki-stable.tgz
mv dokuwiki-*/ dokuwiki

# Change permissions.
chown -R www-data:www-data /var/www/dokuwiki

# Change document root in Apache to point to /var/www/dokuwiki

# Replace
# DocumentRoot /var/www/html
# with
# DocumentRoot /var/www/dokuwiki
sed -i -e "s/DocumentRoot\ \/var\/www\/html/DocumentRoot\ \/var\/www\/dokuwiki/g" /etc/apache2/sites-enabled/000*.conf
# Change AllowOverrides setting in Apache2 to use .htaccess files for security.

# For directory /var/www/ replace
# AllowOverride None
# with
# AllowOverride All
sed -i -e "s/AllowOverride\ None/AllowOverride\ All/g" /etc/apache2/apache2.conf

# Restart Apache2 service.
service apache2 restart
