class SecretWord
  attr_accessor :secret_word, :length, :empty_spaces, :letters
  def initialize(word)
    @secret_word = word.chomp.downcase
    @length = word.length
    @empty_spaces = word.length
    @letters = word.chomp.split("")
  end
end