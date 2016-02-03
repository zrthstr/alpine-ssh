FROM alpine:latest
MAINTAINER polandj


RUN apk update && apk add openssh 
RUN sed -i "s/UsePrivilegeSeparation.*/UsePrivilegeSeparation no/g" /etc/ssh/sshd_config \
	&& sed -i "s/UsePAM.*/UsePAM no/g" /etc/ssh/sshd_config \
	&& sed -i "s/#PermitRootLogin.*/PermitRootLogin yes/g" /etc/ssh/sshd_config

ADD run.sh /run.sh
RUN chmod +x /*.sh

EXPOSE 22
CMD ["sh", "/run.sh"]
