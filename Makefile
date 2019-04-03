
all:
	git pull
	sudo docker build -t zrthstr/alpine-ssh .
	#sudo docker login
	sudo docker push zrthstr/alpine-ssh
