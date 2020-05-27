require "yaml"
require "pry"
# require modules here

def load_library (file)
  # code goes here
  emoticons = YAML.load_file('./lib/emoticons.yml')
emo = {}
  emoticons.each do |name,arrays|
      emo[name] ||= {}
      emo[name][:english] = arrays[0]
      emo[name][:japanese] = arrays[1]
  end
emo
end
      

def get_japanese_emoticon(file_path, emoticon)
  emoticons = load_library(file_path)
  emoji = emoticons.values.find {|faces| faces[0] == emoticon}
  emoji == nil ? "Sorry, that emoticon was not found" : emoji[1]
end

def get_english_meaning(file_path, emoticon)
  emoticons = load_library(file_path)
  emoji = emoticons.find {|name, faces| faces[1] == emoticon }
  emoji == nil ? "Sorry, that emoticon was not found" : emoji[0]
end