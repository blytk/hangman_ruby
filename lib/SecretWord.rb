require_relative "Player"
require_relative "Display"

class SecretWord
  attr_accessor :secret_word, :length, :empty_spaces, :letters

  def initialize(word)
    @secret_word = word.chomp.downcase
    @length = word.length
    @empty_spaces = word.length
    @letters = word.chomp.split("")
  end

  def print_word_status(player)
    Display.print_message("Secret Word: ")
    Display.print_message(create_temp_word(player))
  end

  def create_temp_word(player)
    temp_word_array = []
    @empty_spaces.times do 
      temp_word_array.push(nil)
    end

    letters_guessed = player.letters_guessed
    
    secret_word_array = @secret_word.split("")
    secret_word_array.each_with_index do |char, char_index|
      if letters_guessed.include?(char)
        temp_word_array[char_index] = char 
      else
        temp_word_array[char_index] = "_"
      end
    end

    temp_word_string = temp_word_array.join(" ")
    temp_word_string
  end
end