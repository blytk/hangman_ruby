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

  def player_selects
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

    update_guess_number
      
    Display.print_message("You have selected: #{input}")
    self.last_guess = input
    self.letters_guessed.push(input)
  end

  def update_guess_number
    self.guess_number += 1
    self.guesses_remaining -=1
    Display.print_message("Guess number #{self.guess_number} | Guesses remaining: #{self.guesses_remaining}")
  end
end