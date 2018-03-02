require "colorize"

# Helps clean out the sketch and game logic from the Game class.
class GameHelper
  attr_reader :table

  def initialize(table)
    @table = table
  end

  def self.sketch(table)
    "
    -------------------
    |  #{colorize(table[0])}  |  #{colorize(table[1])}  |  #{colorize(table[2])}  |
    -------------------
    |  #{colorize(table[3])}  |  #{colorize(table[4])}  |  #{colorize(table[5])}  |
    -------------------
    |  #{colorize(table[6])}  |  #{colorize(table[7])}  |  #{colorize(table[8])}  |
    -------------------
    "
  end

  def self.colorize(string)
    (string == "X" || string == "O") ? string.red : string.white
  end

  def calculate_win
    rows || columns || diagonal || antidiagonal
  end

  def rows
    index = 0
    row = []

    length.times do
      length.times do
        row << table[index]
        index += 1
      end
      if all_same? row
        return true
      end
      row = []
    end

    false
  end

  def columns
    column = []

    length.times.with_index do |incrementor|
      index = 0 + (incrementor - 1)
      length.times do
        column << table[index]
        index += length
      end
      if all_same? column
        return true
      end
      column = []
    end

    false
  end

  def diagonal
    index = 0
    diagonal = []

    length.times do
      diagonal << table[index]
      index += (length + 1)
    end

    all_same? diagonal
  end

  def antidiagonal
    index = length - 1
    antidiagonal = []

    length.times do
      antidiagonal << table[index]
      index += (length - 1)
    end

    all_same? antidiagonal
  end

  def length
    Math.sqrt(table.size).to_i
  end

  def all_same?(array)
    array.all? { |element| (element == "X") }  || array.all? { |element| (element == "O") }
  end

  def calculate_tie
    (table.count("X") + table.count("O") == table.size) ? true : false
  end
end
