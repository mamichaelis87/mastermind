#self-explanatory class

require_relative 'display.rb'

class Guesser
  include Display
  attr_accessor :current_guess
  attr_reader :name

  def initialize(name)
    @name = name
    @current_guess = []
  end

  def get_guess
    @current_guess = gets.chomp.downcase.split
  end

  def valid_guess?(guess, valid_colors)
    if (guess - valid_colors).empty? && guess.length == 4
      true
    else 
      false
    end
  end

end