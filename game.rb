require "colorize"

class Game
  require_relative "game_helper"

  def initialize
    @table = ('1'..'9').to_a
    @x_is_next = true
  end

  def start
    loop do
      if winner?
        puts "The winner is: " + @current_player
        print_winner_table
        break
      end

      @current_player = @x_is_next ? 'X' : 'O'
      puts "Next player: " + @current_player.red
      print_table

      input = gets.chomp
      if valid_input?(input)
        update(input.to_i, @current_player)
        next
      elsif input == "exit"
        puts "Goodbye!"
        break
      else
        puts "Invalid input, try again!"
        next
      end

    end
  end

  # Helper methods
  def winner?
    GameHelper.calculate_winner(@table)
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
end

Game.new.start
