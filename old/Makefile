all: install

configinstall:
	mkdir -p /var/log/nginx/fools-paradox
	cp conf/nginx/fools-paradox.conf /etc/nginx/conf.d/

reload:
	service nginx reload

content:
	mkdir -p /home/web/fools-paradox
	rsync -qrcC --delete htdocs/  /home/web/fools-paradox/
	chown -R nginx:adm /home/web/fools-paradox
	(find /home/web/fools-paradox -type f -print0|xargs -0 chmod 640)
	(find /home/web/fools-paradox -type d -print0|xargs -0 chmod 750)

prodhook:
	echo '#!/bin/bash' > .git/hooks/post-merge
	echo 'hooks/post-merge' >> .git/hooks/post-merge
	chmod 755 .git/hooks/post-merge

install: configinstall content reload

