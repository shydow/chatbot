FROM ubuntu

Maintainer Shydow Lee

ADD bot.py /app/chatbot/

RUN apt-get update \
  && apt-get install -y python3-pip python3-dev \
  && cd /usr/local/bin \
  && ln -s /usr/bin/python3 python \
  && pip3 install --upgrade pip

RUN \
	cd /app/chatbot && \
	python -m venv p3 && \
	source p3/bin/activate && \
	python --version
	pip3 -V && \
	pip3 install chatterbot && \
	pip3 install hug && \
	hug -f bot.py

EXPOSE 8000


