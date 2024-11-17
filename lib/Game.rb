require_relative "Drawing"
require_relative "Player"
require_relative "SecretWord"
require_relative "Display"

dictionary =  []

# Load dictionary, words between 5-12 characters
File.open("10000_word_dictionary.txt", "r") do |file|
  lines = file.readlines
  lines.each do |word|
    if word.length >= 5 && word.length <= 12
            dictionary.push(word)
    end    
  end
end

secret_word = SecretWord.new(dictionary.sample)
player = Player.new
player.player_selects





