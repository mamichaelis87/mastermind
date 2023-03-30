#self-explanatory class

class Creator 
  attr_accessor :code
  attr_reader :name

  def initialize(name)
    @name = name
    @code = nil
    @valid_colors = ["red", "orange", "yellow", "green", "blue", "purple"]
  end

  def get_code
    @code = gets.chomp.downcase.split
  end

  def valid_code?
    if (@code - @valid_colors).empty? && code.length == 4
      true
    else 
      false
    end
  end

end