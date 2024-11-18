require_relative "Display"

# Player class
class Player
  attr_accessor :guess_number, :guesses_remaining, :last_guess, :letters_guessed

  @@GUESSES_REMAINING = 7

  def initialize
    @guess_number = 0
    @guesses_remaining = @@GUESSES_REMAINING
    @last_guess = ""
    @letters_guessed = []
  end

  def player_selects(secret_word)
    input = ""
    # input needs to be a letter a-z / A-Z
    while true
      check_1 = false
      check_2 = false

      Display.print_message("Enter your guess: ")
      input = gets.chomp.downcase.chr

      if input.match?(/\A[a-zA-Z]\z/)
        check_1 = true
      else
        Display.print_message("Invalid guess, try a letter")
      end
  
      # input should not have been already guessed
      if letters_guessed.include?(input)
        Display.print_message("That letter has already been tried. Try again.")
        input = ""
      else
        check_2 = true
      end

      if check_1 == true && check_2 == true
        break
      end
    end

    
      
    Display.print_message("You have selected: #{input}")
    self.last_guess = input
    self.letters_guessed.push(input)
    self.print_guessed_letters

    add_guess_number

    # If guess it not in secret word, we deduct 1 remaining guess
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

end