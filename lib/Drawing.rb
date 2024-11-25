# Class to draw the hangman in its different stages
class Drawing
  def self.draw_stick(guesses_remaining)
    case guesses_remaining
    when 7
      puts ""
    when 6
      puts "---------------"
      puts "              ||"
      puts "              ||"
      puts "              ||"
      puts "              ||"
      puts "              ||"
      puts "              ||"
      puts "              ||"
      puts "================"
    when 5
      puts "---------------"
      puts "     |        ||"
      puts "     O        ||"
      puts "              ||"
      puts "              ||"
      puts "              ||"
      puts "              ||"
      puts "              ||"
      puts "================"
    when 4
      puts "---------------"
      puts "     |        ||"
      puts "     O        ||"
      puts "     |        ||"
      puts "              ||"
      puts "              ||"
      puts "              ||"
      puts "              ||"
      puts "================"
    when 3
      puts "---------------"
      puts "     |        ||"
      puts "     O        ||"
      puts "    /|        ||"
      puts "              ||"
      puts "              ||"
      puts "              ||"
      puts "              ||"
      puts "================"
    when 2
      puts "---------------"
      puts "     |        ||"
      puts "     O        ||"
      puts "    /|\\       ||"
      puts "              ||"
      puts "              ||"
      puts "              ||"
      puts "              ||"
      puts "================"
    when 1
      puts "---------------"
      puts "     |        ||"
      puts "     O        ||"
      puts "    /|\\       ||"
      puts "    /         ||"
      puts "              ||"
      puts "              ||"
      puts "              ||"
      puts "================"
    else
      puts "---------------"
      puts "     |        ||"
      puts "     O        ||"
      puts "    /|\\       ||"
      puts "    / \\       ||"
      puts "              ||"
      puts "              ||"
      puts "              ||"
      puts "================"
    end
  end
end