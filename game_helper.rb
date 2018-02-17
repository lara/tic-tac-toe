require "colorize"

class GameHelper
  def self.sketch(table)
    "
    -------------------
    |  #{table[0].red}  |  #{table[1].red}  |  #{table[2].red}  |
    -------------------
    |  #{table[3].red}  |  #{table[4].red}  |  #{table[5].red}  |
    -------------------
    |  #{table[6].red}  |  #{table[7].red}  |  #{table[8].red}  |
    -------------------
    "
  end

  def self.calculate_winner(table)
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
      if (table[a] && (table[a] == table[b]) && (table[a] == table[c]))
        return true
      end
    end
    return false
  end

  def self.calculate_tie(table)
    count = table.count("X") + table.count("O")
    if count == 9
      return true
    else
      return false
    end
  end
end
