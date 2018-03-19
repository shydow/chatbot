FROM centos

Maintainer Shydow Lee

ENV chatbot /app/chatbot

RUN sudo yum -y update & sudo yum -y install yum-utils & sudo yum -y groupinstall development & sudo yum -y install https://centos7.iuscommunity.org/ius-release.rpm & sudo yum -y install python36u & sudo yum -y install python36u-pip & sudo yum -y install python36u-devel

WORKDIR ${appDir}
ADD bot.py

EXPOSE 8000


