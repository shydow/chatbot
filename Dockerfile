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
	yum -y install python36u-devel

RUN \
	mkdir -p /app/chatbot && \
	cd /app/chatbot && \
	python3.6 -m venv p3 && \
	source p3/bin/activate && \
	python --version && \
	pip -V

RUN \
	pip install chatterbot && \
	pip install hug

RUN "hug -f bot.py"

ADD bot.py

EXPOSE 8000


