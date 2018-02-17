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

  def self.calculate_win(table)
    rows = [
      [0, 1, 2],
      [3, 4, 5],
      [6, 7, 8],
      [0, 3, 6],
      [1, 4, 7],
      [2, 5, 8],
      [0, 4, 8],
      [2, 4, 6],
    ]
    rows.each do |row|
      a, b, c = row
      if ((table[a] == table[b]) && (table[a] == table[c]))
        return true
      end
    end
    return false
  end

  def self.calculate_tie(table)
    (table.count("X") + table.count("O") == 9) ? true : false
  end
end
