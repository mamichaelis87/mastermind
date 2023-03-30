require_relative 'game.rb'
require_relative 'knuth_codes.rb'

class Computer < Game
include KnuthCodes
attr_accessor :possible_codes, :guess_number, :code, :current_guess


  def initialize
    @current_guess = nil
    @guess_tracker = {}
    @colors = @colors = ["red", "orange", "yellow", "green", "blue", "purple"]
    @guess_number = 1
    @possible_codes = get_knuth_codes
    @code = nil
    @feedback = {  #just here so evaluate_code call works
      colors: 0 ,
      spots: 0  
    }
  end

  # self-explanatory
  def random_guess
    @current_guess = [@colors.sample, @colors.sample, @colors.sample, @colors.sample]
    @guess_number += 1
	end

 #


  # my first attempt to produce a guess that followed the knuth algorithm
  # As currently constructed, it does not follow the logic of the algorithm,
  # it simply returns the first guess 12 times, because the first guess always 
  # remains in @possible_guesses.  Do more research on the knuth algorithm
  def knuth_method(previous_guess, feedback)
    
    @possible_codes = @possible_codes.select do |code|
      evaluate_guess(code) == evaluate_guess(previous_guess)
    end
    @current_guess = @possible_codes[0]
  
    @guess_tracker[guess_number] = {guess: previous_guess,
      feedback: [feedback[:colors], feedback[:spots]]}
    @guess_number += 1

  end

  # always gets the right answer on the first try.
  def god_mode(code)
    @current_guess =  code
  end

end

# game = Game.new
# john = Computer.new
# john.code = game.code
# john.knuth_method(["red", "red", "orange", "orange"], {
#   colors: 3 ,
#   spots: 1  
# })
