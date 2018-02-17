require 'colorize'

class GameHelper
  def self.sketch(contents)
    "
    -------------------
    |  #{contents[0].red}  |  #{contents[1].red}  |  #{contents[2].red}  |
    -------------------
    |  #{contents[3].red}  |  #{contents[4].red}  |  #{contents[5].red}  |
    -------------------
    |  #{contents[6].red}  |  #{contents[7].red}  |  #{contents[8].red}  |
    -------------------
    "
  end

  def self.calculate_winner(contents)
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
      if (contents[a] && (contents[a] == contents[b]) && (contents[a] == contents[c]))
        return contents[a]
      end
    end
    return false
  end
end
