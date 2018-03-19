FROM centos

Maintainer Shydow Lee

ENV chatbot /app/chatbot
ADD bot.py

RUN \
	yum -y update && \
	yum -y install yum-utils && \
	yum -y groupinstall development && \
	yum -y install https://centos7.iuscommunity.org/ius-release.rpm && \
	yum -y install python36u && \
	yum -y install python36u-pip && \
	yum -y install python36u-devel

RUN \
	mkdir -p /app/chatbot && \
	cd /app/chatbot && \
	pip3.6 -V && \
	pip3.6 install chatterbot && \
	pip3.6 install hug && \
	python3.6 -m venv p3 && \
	source p3/bin/activate && \
	python --version

RUN "hug -f bot.py"

EXPOSE 8000


