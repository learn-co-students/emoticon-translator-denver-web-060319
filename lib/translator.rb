# require modules here
require 'yaml'
require 'pry'

def load_library(path)
  # code goes here
  temp = {
  	"get_emoticon" => {},
  	"get_meaning" => {}
  }
  YAML.load_file(path).each do |key, val|
  	english,japanese = val
	temp["get_emoticon"][english] = japanese
	temp["get_meaning"][japanese] = key
  end

  temp
end

def get_japanese_emoticon(path, emoticon)
	temp = load_library(path)
	temp["get_emoticon"].each do |eng, jap|
		if (eng == emoticon)
			return jap
		end
	end
	return "Sorry, that emoticon was not found"
end

def get_english_meaning(path, emoticon)
	temp = load_library(path)
	temp["get_meaning"].each do |jap, meaning|
		if (jap == emoticon)
			return meaning
		end
	end
	return "Sorry, that emoticon was not found"
end