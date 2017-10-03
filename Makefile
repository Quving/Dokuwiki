docker_start:
	docker run --restart=always -d -p 9080:80 --name dokuwiki \
		-v /srv/dokuwiki:/dokuwiki mprasil/dokuwiki:latest
