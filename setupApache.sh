sudo apt-get install apache2 
sudo mkdir -p /var/www/prepHub/public_html

sudo chown -R $USER:$USER /var/www/prepHub/public_html
cp ./homepage.html /var/www/prepHub/public_html/index.html

sudo chmod -R 755 /var/www

sudo cp prepHub.conf /etc/apache2/sites-available/prepHub.conf

echo "Listen 8080" | sudo tee -a /etc/apache2/ports.conf 

sudo a2ensite prepHub.conf

sudo service apache2 restart 
