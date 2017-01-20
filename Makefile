build:
	docker build -t dokuwiki:latest . 
run:
	docker run -it -d --name dokuwiki -p 33121:80 dokuwiki:latest
