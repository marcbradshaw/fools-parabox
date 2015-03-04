all: install

configinstall:
	mkdir -p /var/log/apache2/foolsparadox.com
	chown www-data:www-data /var/log/apache2/foolsparadox.com 
	cp conf/apache/foolsparadox.com.conf /etc/apache2/sites-available/
	a2ensite foolsparadox.com.conf

reload:
	service apache2 reload

content:
	mkdir -p /home/web/foolsparadox.com
	rsync -qrcC --delete htdocs/  /home/web/foolsparadox.com/

install: configinstall content reload

