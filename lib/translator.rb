require "yaml"
require 'pry'

####THE HAS WE ARE USING.

#{"angel"=>["O:)", "☜(⌒▽⌒)☞"],
 #{}"angry"=>[">:(", "ヽ(ｏ`皿′ｏ)ﾉ"],
 #{}"bored"=>[":O", "(ΘεΘ;)"],
 #{}"confused"=>["%)", "(゜.゜)"],
 #{}"embarrased"=>[":$", "(#^.^#)"],
 #{}"fish"=>["><>", ">゜))))彡"],
 #{}"glasses"=>["8D", "(^0_0^)"],
 #{}"grinning"=>["=D", "(￣ー￣)"],
 #{}"happy"=>[":)", "(＾ｖ＾)"],
 #{}"kiss"=>[":*", "(*^3^)/~☆"],
 #{}"sad"=>[":'(", "(Ｔ▽Ｔ)"],
 #{}"surprised"=>[":o", "o_O"],
 #{}"wink"=>[";)", "(^_-)"]}

def load_library(file_path)
  emoticons = YAML.load_file(file_path)
  library = {"get_meaning" => {}, "get_emoticon" => {}}
  emoticons.each do |a, b|
      #binding.pry
      library["get_meaning"][b[1]] = a
  end
  emoticons.each do |a, b|
    library["get_emoticon"][b[0]] = b[1]
  end
  library

end


##LIBRARY.
#{"get_meaning"=>
#  {"☜(⌒▽⌒)☞"=>"angel",
#   "ヽ(ｏ`皿′ｏ)ﾉ"=>"angry",
#   "(ΘεΘ;)"=>"bored",
#   "(゜.゜)"=>"confused",
#   "(#^.^#)"=>"embarrased",
#   ">゜))))彡"=>"fish",
#   "(^0_0^)"=>"glasses",
#   "(￣ー￣)"=>"grinning",
#   "(＾ｖ＾)"=>"happy",
#   "(*^3^)/~☆"=>"kiss",
#   "(Ｔ▽Ｔ)"=>"sad",
#   "o_O"=>"surprised",
#   "(^_-)"=>"wink"},
 #"get_emoticon"=>
#  {"O:)"=>"☜(⌒▽⌒)☞",
#   ">:("=>"ヽ(ｏ`皿′ｏ)ﾉ",
#   ":O"=>"(ΘεΘ;)",
#   "%)"=>"(゜.゜)",
#   ":$"=>"(#^.^#)",
#   "><>"=>">゜))))彡",
#   "8D"=>"(^0_0^)",
#   "=D"=>"(￣ー￣)",
#   ":)"=>"(＾ｖ＾)",
#   ":*"=>"(*^3^)/~☆",


def get_japanese_emoticon(file_path, emoticon)
  library_hash = load_library(file_path)
  library_hash.map do |a, b|
      if (a == "get_emoticon") && (b.keys.include?(emoticon) == true)
        return b[emoticon]
      elsif a == "get_emoticon" && b.keys.include?(emoticon) == false
        return "Sorry, that emoticon was not found"
      end
  end
end

def get_english_meaning(file_path, emoticon)
  library = load_library(file_path)
  library.each do |a, b|
    if a == "get_meaning" && (b.keys.include?(emoticon) == true)
      return b[emoticon]
    elsif a == "get_meaning" && b.keys.include?(emoticon) == false
      return "Sorry, that emoticon was not found"
    end
  end
end
