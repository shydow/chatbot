#!/usr/bin/env python
# coding: utf-8

from chatterbot import ChatBot
from chatterbot.trainers import ChatterBotCorpusTrainer
import hug

bot = ChatBot(
    "sample",
    storage_adapter="chatterbot.storage.SQLStorageAdapter",
    logic_adapters=[
        "chatterbot.logic.MathematicalEvaluation",
        "chatterbot.logic.TimeLogicAdapter",
        "chatterbot.logic.BestMatch"
    ],
    output_adapter="chatterbot.output.TerminalAdapter",
    database="../database.db"
)
bot.set_trainer(ChatterBotCorpusTrainer)
# 使用中文语料库训练它
bot.train(
	"chatterbot.corpus.chinese",
	"./data/"
)  # 语料库


@hug.get()
def chat(input):
    response = bot.get_response(input).text
    return {"response":response}

