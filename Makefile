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
	chown -R root:www-data /home/web/foolsparadox.com
	(find /home/web/foolsparadox.com -type f -print0|xargs -0 chmod 640)
	(find /home/web/foolsparadox.com -type d -print0|xargs -0 chmod 750)

prodhook:
	echo '#!/bin/bash' > .git/hooks/post-merge
	echo 'hooks/post-merge' >> .git/hooks/post-merge
	chmod 755 .git/hooks/post-merge
	mkdir -p /etc/twofiftyeight/deploy_manager
	cp conf/deploy.json /etc/twofiftyeight/deploy_manager/foolsparadox.json

install: configinstall content reload

