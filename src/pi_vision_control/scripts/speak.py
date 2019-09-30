# coding: UTF-8
import requests
import sys
from pydub import AudioSegment
from pydub.playback import play
import os

url = 'https://api.voicetext.jp/v1/tts'
API_KEY = os.environ["VOICE_TEXT_API"]

def makeFile(text):
  payload = {
      'text': text,
      'speaker': 'show',
      'volume': 200
      }
  r = requests.post(url, params=payload, auth=(API_KEY,''))
  print "status code:", r.status_code
  if r.status_code != 200:
      print "error:", r.json()['error']['message']
      sys.exit()
  f = open("test.wav", 'wb')
  f.write(r.content)
  f.close()

def speak1():
  sound = AudioSegment.from_file("test.wav", "wav")
  play(sound)

def speak2():
  sound = AudioSegment.from_file("test.wav", "wav")
  play(sound)

makeFile("嫌です-")
speak1()
makeFile("わかりましたぁ")
speak2()
