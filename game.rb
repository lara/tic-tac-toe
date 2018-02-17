require "colorize"
require_relative "game_helper"

class Game
  def initialize
    @table = ("1".."9").to_a
    @x_is_next = true
  end

  def start
    puts "\n| Tic-Tac-Toe | ".yellow + "\n\n(Input the number you'd like your mark to be on)".magenta
    init
  end

  def init
    loop do
      win if win?
      tie if tie?

      @current_player = @x_is_next ? "X" : "O"
      puts "\nNext player: " + @current_player.red
      print_table
      input = gets.chomp

      if valid_input?(input)
        update(input.to_i, @current_player)
        next
      elsif input == "exit"
        quit
      else
        invalid_input
        next
      end
    end
  end

  def win?
    GameHelper.calculate_winner(@table)
  end

  def tie?
    GameHelper.calculate_tie(@table)
  end

  def win
    print_table
    puts "The winner is: " + @current_player
    end_of_game
  end

  def tie
    print_table
    puts "It was a tie!"
    end_of_game
  end

  def end_of_game
    loop do
      puts "Would you like to play again? (y/n)"

      input = gets.chomp
      if input == "y"
        restart
      elsif input == "n"
        quit
      else
        invalid_input
        next
      end
    end
  end

  def print_table
    puts GameHelper.sketch(@table)
  end

  def update(position, current_player)
    @table[position - 1] = current_player
    @x_is_next = !@x_is_next
  end

  def valid_input?(input)
    input.to_i.between?(1, 9) &&
    !(@table[input.to_i - 1] == "X" || @table[input.to_i - 1] == "O")
  end

  def invalid_input
    puts "Invalid input, try again!"
  end

  def restart
    Game.new.start
  end

  def quit
    puts "Goodbye!"
    exit(0)
  end
end

Game.new.start
