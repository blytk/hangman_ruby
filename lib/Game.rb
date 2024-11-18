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
            dictionary.push(word.chomp)
    end    
  end
end

def game_loop(dictionary)
  game_over = false
  # Create secret word to guess
  secret_word = SecretWord.new(dictionary.sample)
  ######### DEBUG
  p secret_word.secret_word
  ######## DEBUG
  # Create player
  player = Player.new
  # While game is not over
  until game_over == true
    if player.guesses_remaining <= 0
      game_over = true
      Display.print_message("You are out of guesses, game is over")
      break
    end
    # Player makes a choice
      # Display how many guesses so far (player.player_selects triggers this)
      # Display how many guesses remaining (player.player_selects triggers this)
      # # Display player selections so far
    player.player_selects(secret_word)
    # Display hangman
    Drawing.draw_stick(player.guess_number)
    secret_word.print_word_status(player)

    # Display word in current status (empty spaces, letters present in word)

  end
  
end

game_loop(dictionary)





