require_relative 'display.rb'

class Game
  include Display
  attr_accessor :code, :guesser
  attr_reader :feedback
  

  def initialize
    @code = ["red", "orange", "red", "orange"]
    @guesser = nil
    @feedback = {
      colors: 0 ,
      spots: 0  
    }
  end

  def check_for_win(guess)
    if guess == @code
      true
    else 
      false
    end
  end

  #generates feedback of correct colors and correct colors in the right spot
  def evaluate_guess(guess)
    correct_colors = 0
    correct_spots = 0
    guess.each_with_index do |color, spot| 
          if guess.index(color) == spot
            if @code.count(color) <= guess.count(color)
              correct_colors += @code.count(color)
            else
              correct_colors += guess.count(color)
            end
          end
        end
    guess.each_with_index do |color, spot|
      if color == code[spot]
        correct_spots += 1
        correct_colors -= 1
      end
    end
    @feedback[:colors] = correct_colors
    @feedback[:spots] = correct_spots
    [correct_colors, correct_spots]
  end

end

# game = Game.new
# game.code = ["green", "red", "yellow", "purple"]
# game.evaluate_guess(["green", "green", "red", "purple"])
# puts game.feedback[:colors], game.feedback[:spots]