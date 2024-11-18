require_relative "Drawing"
require_relative "SecretWord"
require_relative "Display"
require "yaml"

class Game
  attr_accessor :dictionary, :guess_number, :guesses_remaining, :letters_guessed, :last_guess, :secret_word

  @@initial_number_of_guesses = 7
  @@dictionary_file = "10000_word_dictionary.txt"

  def initialize
    @dictionary = []
    @guess_number = 0
    @guesses_remaining = @@initial_number_of_guesses
    @letters_guessed = []
    @last_guess = ""
    @secret_word = nil
  end

  def save_game
    # serialize game object
    yaml_string = YAML.dump(self)
    # save to file
    if !Dir.exist?("./saves")
      Dir.mkdir("./saves")
    end
    puts "Enter a filename to save"
    save_name = gets.chomp.downcase
    File.write("./saves/#{save_name}.yaml", yaml_string)
    true
  end

  def load_game
    # deserialize game object
    puts "Enter the name of the save to load"
    save_to_load = gets.chomp.downcase
    if File.exist?("./saves/#{save_to_load}.yaml")
          File.open("./saves/#{save_to_load}.yaml") do |file|
            yaml_content = file.read
            deserialized_object = YAML.safe_load(yaml_content, permitted_classes: [Game])
            @dictionary = deserialized_object.dictionary
            @guess_number = deserialized_object.guess_number
            @guesses_remaining = deserialized_object.guesses_remaining
            @letters_guessed = deserialized_object.letters_guessed
            @last_guess = deserialized_object.last_guess
            @secret_word = deserialized_object.secret_word
          end
      Display.print_message("Game loaded successfuly")
    else
      Display.print_message("Save game does not exist or error loading the game")  
    end
  end

  # Load dictionary, words between 5-12 characters
  def load_dictionary
    File.open(@@dictionary_file, "r") do |file|
      lines = file.readlines
      lines.each do |word|
        if word.length >= 5 && word.length <= 12
          @dictionary.push(word.chomp.downcase)
        end
      end
    end
  end

  def player_selects(secret_word)
    input = ""
    while true
      check1 = false
      check2 = false

      Display.print_message("Enter your guess: ")
      input = gets.chomp.downcase
      if input == "save"
        # save the game
        save_game
      elsif input == "load"
        # load a game
        load_game

      else
        input = input.chr
        if input.match?(/\A[a-zA-Z]\z/)
          check1 = true
        else
          Display.print_message("Invalid guess, try a letter")
        end
  
        # input should not have been already guessed
        if letters_guessed.include?(input)
          Display.print_message("That letter has already been tried. Try another letter.")
          input = ""
        else
          check2 = true
        end
  
        if check1 == true && check2 == true
          break
        end
      end


    end
    Display.print_message("You have selected: #{input}")
    self.last_guess = input
    self.letters_guessed.push(input)
    self.print_guessed_letters  

    add_guess_number

    # if guess is not in secret word, we deduct 1 remaining guess
    if !secret_word.secret_word.include?(self.last_guess)
      deduct_guess_remaining
    end

    print_guess_status

  end

  def add_guess_number
    self.guess_number += 1
  end

  def deduct_guess_remaining
    self.guesses_remaining -= 1
  end

  def print_guess_status
    Display.print_message("Guess # #{self.guess_number} | Guesses remaining: #{self.guesses_remaining}")
  end

  def print_guessed_letters
    Display.print_message("The characters you have chosen so far are: #{@letters_guessed}")
  end
  
  def victory?(secret_word)
    secret_word.secret_word.split("").each do |char|
      if @letters_guessed.length == 0
        return false
      elsif !@letters_guessed.include?(char)
        return false
      end
    end
    return true
  end

  def game_loop(game)
    game_over = false
    victory = false
    # Create secret word to guess
    secret_word = SecretWord.new(@dictionary.sample)
    ######### DEBUG
    p secret_word.secret_word
    ######## DEBUG
    #
    # While game is not over
    until game_over == true
      if @guesses_remaining <= 0
        game_over = true
        Display.print_message("You are out of guesses, game is over")
        break
      end
      # Player makes a choice
        # Display how many guesses so far (player.player_selects triggers this)
        # Display how many guesses remaining (player.player_selects triggers this)
        # # Display player selections so far
      player_selects(secret_word)
      # Display hangman
      Drawing.draw_stick(@guesses_remaining)
      # Display word in current status (empty spaces, letters present in word)
      secret_word.print_word_status(game)

      # check if player has won
      if victory?(secret_word)
        victory = true
        game_over = true
        Display.print_message("You have guessed the word and won the game")
      end    

    end
  end
end

# New game
game = Game.new
# Load dictionary
game.load_dictionary
# Game loop
game.game_loop(game)