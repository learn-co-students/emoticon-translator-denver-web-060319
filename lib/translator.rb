require 'yaml'
require 'pry'

# {"angel"=>["O:)", "☜(⌒▽⌒)☞"],
#  "angry"=>[">:(", "ヽ(ｏ`皿′ｏ)ﾉ"],
#  "bored"=>[":O", "(ΘεΘ;)"],
#  "confused"=>["%)", "(゜.゜)"],
#  "embarrased"=>[":$", "(#^.^#)"],
#  "fish"=>["><>", ">゜))))彡"],
#  "glasses"=>["8D", "(^0_0^)"],
#  "grinning"=>["=D", "(￣ー￣)"],
#  "happy"=>[":)", "(＾ｖ＾)"],
#  "kiss"=>[":*", "(*^3^)/~☆"],
#  "sad"=>[":'(", "(Ｔ▽Ｔ)"],
#  "surprised"=>[":o", "o_O"],
#  "wink"=>[";)", "(^_-)"]}

def load_library path
  file_library = YAML.load_file(path)
  library = file_library.each_with_object ({}) do |(emotion,emoticons), hash|
    hash["get_meaning"] ||= {}
    hash["get_emoticon"] ||= {}
    hash["get_meaning"][emoticons[1]] = emotion
    hash["get_emoticon"][emoticons[0]] = emoticons[1]
  end
end

# load_library './lib/emoticons.yml'

def get_japanese_emoticon path, emoticon
  library = load_library(path)
  library["get_emoticon"].fetch(emoticon, "Sorry, that emoticon was not found")
end

def get_english_meaning path, emoticon
  library = load_library(path)
  library["get_meaning"].fetch(emoticon, "Sorry, that emoticon was not found")
end