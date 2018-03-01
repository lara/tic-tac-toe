require "colorize"
require_relative "game_helper"

class Game
  def initialize
    @table = ("1".."9").to_a
    @x_is_next = true
  end

  def start
    puts "\n| Tic-Tac-Toe | ".yellow
    puts "\n(Input the number you'd like your mark to be on)".magenta

    loop do
      next_turn
    end
  end

  def next_turn
    check_status
    set_current_player unless @invalid_input
    puts "\nNext player: " + @current_player.red
    print_table
    input = gets.chomp

    if valid_input?(input)
      update_table(input.to_i, @current_player)
    elsif input == "exit"
      quit
    else
      invalid_input
    end
  end

  def set_current_player
    @current_player = @x_is_next ? "X" : "O"
    @x_is_next = !@x_is_next
  end

  def print_table
    puts GameHelper.sketch(@table)
  end

  def update_table(position, current_player)
    @table[position - 1] = current_player
  end

  def valid_input?(input)
    input.to_i.between?(1, 9) &&
      !(@table[input.to_i - 1] == "X" || @table[input.to_i - 1] == "O")
  end

  def invalid_input
    puts "Invalid input, try again!"
    @invalid_input = true
  end

  def check_status
    (handle_tie if tie?) || (handle_win if win?)
  end

  def win?
    GameHelper.calculate_win(@table)
  end

  def tie?
    GameHelper.calculate_tie(@table)
  end

  def handle_win
    print_table
    puts "The winner is: " + @current_player.red
    end_of_game
  end

  def handle_tie
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

  def restart
    Game.new.start
  end

  def quit
    puts "Goodbye!"
    exit(0)
  end
end

Game.new.start
