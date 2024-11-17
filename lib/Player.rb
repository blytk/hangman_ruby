require_relative "Display"

# Player class
class Player
  attr_accessor :guess_number, :guesses_remaining, :last_guess, :letters_guessed
  def initialize
    @guess_number = 0
    @guesses_remaining = 7
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
      
    Display.print_message("You have selected: #{input}")
    self.last_guess = input
    self.letters_guessed.push(input)
  end
end