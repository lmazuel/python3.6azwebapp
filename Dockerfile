FROM python:3.6
MAINTAINER Laurent Mazuel<lmazuel@microsoft.com>

COPY init_container.sh /bin/
COPY sshd_config /etc/ssh/

RUN apt-get update -qq \
    && apt-get install -y nodejs openssh-server --no-install-recommends \
    && echo "root:Docker!" | chpasswd

RUN chmod 755 /bin/init_container.sh \
  && mkdir -p /home/LogFiles

EXPOSE 2222 8080

ENV PORT 8080
ENV WEBSITE_ROLE_INSTANCE_ID localRoleInstance
ENV WEBSITE_INSTANCE_ID localInstance
ENV PATH ${PATH}:/home/site/wwwroot

WORKDIR /home/site/wwwroot

ENTRYPOINT [ "/bin/init_container.sh" ]
