require "yaml"
require 'pry'

def load_library(path)
  emoticons = YAML.load_file(path)
  emot_hash = { "get_meaning" => {}, "get_emoticon" => {} }
  emoticons.each do | emotion, arr |
   en, jp = arr
    emot_hash["get_meaning"][jp] = emotion
    emot_hash["get_emoticon"][en] = jp
  end
 emot_hash
end

def get_japanese_emoticon(path, emoticon)
  emot_hash = load_library(path)
  found = emot_hash["get_emoticon"][emoticon]
  if found
   found
  else 
   "Sorry, that emoticon was not found"
  end
end

def get_english_meaning(path, emoticon)
  emot_hash = load_library(path)
  found = emot_hash["get_meaning"][emoticon]
  if found
   found 
  else
   "Sorry, that emoticon was not found"
  end
end