FROM ubuntu

Maintainer Shydow Lee

ADD https://raw.githubusercontent.com/shydow/chatbot/master/bot.py /app/chatbot/

RUN apt-get update \
  && apt-get install -y python3-pip python3-dev \
  && cd /usr/local/bin \
  && ln -s /usr/bin/python3 python \
  && pip3 install --upgrade pip

RUN \
	cd /app/chatbot && \
	python --version && \
	pip -V && \
	pip install chatterbot && \
	pip install hug

CMD	["hug", "-f", "bot.py"]

EXPOSE 8000


