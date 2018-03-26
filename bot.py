#!/usr/bin/env python
# coding: utf-8

from chatterbot import ChatBot
from chatterbot.trainers import ChatterBotCorpusTrainer
import hug


bot = ChatBot("simpleBot")
bot.set_trainer(ChatterBotCorpusTrainer)
# 使用中文语料库训练它
bot.train(
	"chatterbot.corpus.chinese"
	"/app/chatbot/data/"
)  # 语料库


@hug.get()
def chat(input):
    response = bot.get_response(input).text
    return {"response":response}

