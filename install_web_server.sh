#!/bin/bash

# Update package lists
sudo apt update

# Install Apache
sudo apt install -y apache2

# Enable Apache rewrite module
sudo a2enmod rewrite

# Create a directory for the virtual host configuration file
sudo mkdir -p /etc/apache2/sites-available

# Create a virtual host configuration file
sudo tee /etc/apache2/sites-available/mywebsite.conf > /dev/null <<EOF
    <VirtualHost *:80>
        ServerName aidevops.eu
        ServerAlias www.aidevops.eu
        DocumentRoot /var/www/aidevops.eu
        ErrorLog ${APACHE_LOG_DIR}/aidevops.eu_error.log
        CustomLog ${APACHE_LOG_DIR}/aidevops.eu_access.log combined
    </VirtualHost>
EOF

# Enable the virtual host
 sudo a2ensite aidevops.eu
 sudo a2dissite 000-default
 
# Reload Apache to apply changes
sudo systemctl reload apache2
