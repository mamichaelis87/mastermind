#generates random board for when player opts to be guesser

class Board
	attr_reader :code, :colors
	

  def initialize
		@colors = ["red", "orange", "yellow", "green", "blue", "purple"]
		@code = [@colors.sample, @colors.sample, @colors.sample, @colors.sample]
	end
end
