#container for most of the display communication and instructions

module Display
  
  def intro
    puts "Hello, get ready to play mastermind."
  end
  
  def ask_name
    puts "What would you like to be called for the duration of the game?"
  end

  def explain_rules(name)
    puts "Okay #{name}, you must make a guess of four colors.  They must be either \n"\
    "Red, Yellow, Orange, Blue, Green, or Purple. Please list them out \n"\
    "separated by a single space."
  end

  def ask_move
    puts "What is your next guess?"
  end

  def give_feedback(color, spot)
    puts "That guess had #{spot} correct colors in the right spot, \n"\
    "and #{color} correct colors in the wrong spot."
  end

  def winner
    puts "You cracked the code this time.  Are you smart, or just lucky?"
  end

  def loser
    puts "That's incorrect and you're out of guesses, better luck next time kid."
  end

  def invalid_guess
    puts "That is not a valid guess. Please enter four colors separated by one space."
  end

  def invalid_code
    puts "That is not a valid code. Please enter four colors separated by one space."
  end

  def code_keeper_intro(name)
    puts "Alright #{name}, so you think you can best the computer, huh?\n"\
        "Enter a four color clue using any combination of colors from \n"\
        "Red, Orange, Yellow, Green, Blue, and Purple, separated by a space."
  end

  def difficulty 
    puts "Would you like to play on Easy, Medium, Hard, or Impossible?\n"\
        "Please type your answer."
  end
end