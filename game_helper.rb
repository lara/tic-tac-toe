require "colorize"

# Helps clean out the sketch and game logic from the Game class.
class GameHelper
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

  # TODO : Refactor calculate_win to work with components
  def self.calculate_win(table)
    # calculate_rows(table)
    # calculate_columns(table)
    # calculate_diagonal(table)
    # calculate_antidiagonal(table)
  end

  def self.calculate_antidiagonal(table)
    length = Math.sqrt(table.size).to_i
    index = length - 1
    antidiagonal = []

    length.times do
      antidiagonal << table[index]
      index += (length - 1)
    end

    if antidiagonal.all? { |element| (element == "X") || (element == "O") }
      return true
    else
      return false
    end
  end

  def self.calculate_diagonal(table)
    length = Math.sqrt(table.size).to_i
    index = 0
    diagonal = []

    length.times do
      diagonal << table[index]
      index += (length + 1)
    end

    if diagonal.all? { |element| (element == "X") || (element == "O") }
      return true
    else
      return false
    end
  end

  def self.calculate_rows(table)
    length = Math.sqrt(table.size).to_i
    index = 0
    row = []

    length.times do
      length.times do
        row << table[index]
        index += 1
      end
      if row.all? { |element| (element == "X") || (element == "O") }
        return true
      end
      row = []
    end
    return false
  end

  def self.calculate_columns(table)
    length = Math.sqrt(table.size).to_i
    column = []

    length.times.with_index do |incrementor|
      index = 0 + (incrementor - 1)
      length.times do
        column << table[index]
        index += length
      end
      if column.all? { |element| (element == "X") || (element == "O") }
        return true
      end
      column = []
    end
    return false
  end

  def self.calculate_tie(table)
    (table.count("X") + table.count("O") == 9) ? true : false
  end
end
