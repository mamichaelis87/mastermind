require_relative 'guesser.rb'
require_relative 'creator.rb'
require_relative 'display.rb'
require_relative 'random_board.rb'
require_relative 'game.rb'
require_relative 'computer.rb'

def play_as_guesser
  new_game = Game.new
  board = Board.new
  new_game.code = board.code
  new_game.ask_name
  player_name = gets.chomp
  player = Guesser.new(player_name)
  new_game.explain_rules(player.name)
  turn = 1

  until turn > 12
    
    new_game.ask_move
    player.get_guess
    if player.valid_guess?(player.current_guess, board.colors)
      if new_game.check_for_win(player.current_guess)
        new_game.winner
        break
      else
        if turn == 12 
          new_game.loser
          break
        end
        new_game.evaluate_guess(player.current_guess)
        new_game.give_feedback(new_game.feedback[:colors], new_game.feedback[:spots])
      end
      turn += 1
    else
      new_game.invalid_guess
    end
  end
end

def play_as_code_keeper
  new_game = Game.new
  new_game.ask_name
  player_name = gets.chomp
  player = Creator.new(player_name)
  new_game.code_keeper_intro(player.name)
  player.get_code
  until player.valid_code? == true
    new_game.invalid_code
    player.get_code
  end
  new_game.code = player.code
  alexa = Computer.new
  alexa.code = player.code
  new_game.difficulty
  difficulty = gets.chomp.downcase
  until difficulty == "easy" || difficulty == "medium" || difficulty == "hard" || difficulty == "impossible"
    puts "That is not a choice, please type easy, medium, hard, or impossible."
    difficulty = gets.chomp.downcase
  end

  #the following 4 if statements give code that cycles through a specific method 
  #of guessing depending on what difficulty the user chose
  if difficulty == "easy"
    turn = 0
    while turn <= 12
      alexa.random_guess
      puts "Computer Alexa guessed #{alexa.current_guess}."
      if new_game.check_for_win(alexa.current_guess)
        puts "Alexa cracked your code!"
      elsif turn == 12
        puts "Alexa ran out of guesses, you win!"
      end
      turn = alexa.guess_number
    end

  elsif difficulty == "medium"
    turn = 0
    alexa.random_guess
    puts "Computer Alexa guessed #{alexa.current_guess}."
    last_guess = alexa.current_guess
    while turn <= 11
      alexa.barely_educated_guess(last_guess)
      puts "Computer Alexa guessed #{alexa.current_guess}"
      if new_game.check_for_win(alexa.current_guess)
        puts "Alexa cracked your code!"
      elsif turn == 11
        puts "Alexa ran out of guesses, you win!"
      end
      turn = alexa.guess_number
      last_guess = alexa.current_guess
    end

  elsif difficulty == "hard"
    turn = 0
    alexa.current_guess = ["red", "red", "orange", "orange"]
    puts "Computer Alexa guessed #{alexa.current_guess}"
    while turn <= 11
      if new_game.check_for_win(alexa.current_guess)
        puts "Alexa cracked your code!"
      elsif turn == 11
        puts "Alexa ran out of guesses, you win!"
        break
      end
      alexa.knuth_method(alexa.current_guess, alexa.feedback)
      puts "Computer Alexa guessed #{alexa.current_guess}"
      turn = alexa.guess_number
    end

  elsif difficulty == "impossible"
    turn = 0
    while turn <= 12
      alexa.god_mode(player.code)
      if new_game.check_for_win(alexa.current_guess)
        puts "Alexa guessed #{alexa.current_guess}.  You were foolish to \n"\
            "ever challenge Alexa."
        break
      elsif turn == 12
        puts "How can this be? You truly are a code-master.  Alexa failed to \n"\
            "guess your code. I am scared of you."
        break
      end
      turn += 1
    end
  end     
end

def start_game
  puts "Get ready to play Mastermind. \n"\
      "Would you like to be the guesser or code-keeper? \n"\
      "Type 'G' for guesser or 'C' for code-keeper."
  choice = gets.chomp.downcase
  until choice == 'g' || choice == 'c'
    puts "please enter 'G' for guesser or 'C' for code-keeper."
    choice = gets.chomp.downcase
  end
  if choice == 'g'
    play_as_guesser
  elsif choice == 'c'
    play_as_code_keeper
  end
end

start_game

