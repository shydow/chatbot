FROM centos

Maintainer Shydow Lee

ENV chatbot /app/chatbot

RUN \
	yum -y update && \
	yum -y install yum-utils && \
	yum -y groupinstall development && \
	yum -y install https://centos7.iuscommunity.org/ius-release.rpm && \
	yum -y install python36u && \
	yum -y install python36u-pip && \
	yum -y install python36u-devel && \
	pip install chatterbot && \
	pip install hug

RUN \
	python -V && \
	pip -V

RUN "hug -f bot.py"

WORKDIR ${appDir}
ADD bot.py

EXPOSE 8000


