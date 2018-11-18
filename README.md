# Order Shipping Management

An web with PHP with MySQL and PDO, Bootstrap, jQuery and RESTFul API

To:
- Manage order, tracking shipping and delivery status
- Tracking user
- Build base on PHP as a practice with PDO and RESTFul API on PHP

With Slim, rewrite URL is needed, so if using Apache server, the overwrite URL should be enable.

Steps to enable rewrite URL:
- add those lines to /etc/apache2.conf
	<Directory [source_path]>
        AllowOverride All
        Require all granted
        Options Indexes FollowSymLinks Multiviews
        Order allow,deny
        Allow from all
	</Directory>
- Enable module rewrite and restart apache
	sudo a2enmod rewrite && sudo /etc/init.d/apache2 restart

- Slim demo example (http://coenraets.org/blog/2011/12/restful-services-with-jquery-php-and-the-slim-framework/)

- Existing code is good for php 5.6.8
- If using php 7.2, please add session_start() at the begining of the index file