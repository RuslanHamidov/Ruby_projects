# TicTacToe game class based
# Game rules: If one of rows or columns or diagonally filled with X or O three in a row game ends
# What should be initialized when game starts: map?, player turn?
# Map is 2D array

class TicTacToe
  @@turn = 1
  @@checked = []
  def initialize
    puts 'map is created'
    @map = [
      [' ',' ',' '],
      [' ',' ',' '],
      [' ',' ',' ']
    ]
  end

  def start_game
    puts 'game has started'
    flag = true
    while flag
      if @@turn % 2 != 0
        player = 1
      else
        player = 2
      end
      self.show_board
      puts "\nPlayer #{player} turn select space from 1 to 9"
      choice = gets.chomp.to_i
      self.put_sign(choice, player)
      flag = self.check_win?
      @@turn += 1
    end
  end

  private
  def put_sign(position, player)
    if player == 1
      sign = 'X'
    else
      sign = 'O'
    end
    if @@checked.include?(position)
      puts 'This space is already full'
      return
    end
    @@checked.push(position)
    if position > 9
      puts 'You can\'t go that far)'
      return
    end
    if position > 3 && position % 3 != 0
      return @map[position / 3][position % 3 - 1] = sign
    elsif position > 3 && position % 3 == 0
      return @map[position / 3 - 1][2] = sign
    end
    return @map[0][position - 1] = sign
  end

  private
  def check_win?
    3.times do |num|
      if @map[num][0] == 'X' && @map[num][1] == 'X' && @map[num][2] == 'X' || @map[num][0] == 'O' && @map[num][1] == 'O' && @map[num][2] == 'O'
        puts 'Congrats you won'
        self.show_board
        return false
      elsif @map[0][num] == 'X' && @map[1][num] == 'X' && @map[2][num] == 'X' || @map[0][num] == 'O' && @map[1][num] == 'O' && @map[2][num] == 'O'
        puts 'Congrats you won'
        self.show_board
        return false
      elsif @map[0][0] == 'X' && @map[1][1] == 'X' && @map[2][2] == 'X' ||  @map[0][2] == 'X' && @map[1][1] == 'X' && @map[2][0] == 'X' || @map[0][0] == 'O' && @map[1][1] == 'O' && @map[2][2] == 'O' ||  @map[0][2] == 'O' && @map[1][1] == 'O' && @map[2][0] == 'O'
        puts 'Congrats you won'
        self.show_board
        return false
      elsif @@checked.length == 9
        puts 'Tie game'
        self.show_board
        return false
      end
    end
    return true
  end

  private
  def show_board
    @map.each_with_index do |rows, index|
      rows.each_with_index do |columns, index_col|
        if index_col == 2
          print " #{columns} "
        else
          print " #{columns} |"
        end
      end
      puts ""
      if index == 2
        print ""
      else
        print " _________\n"
      end
    end
  end

end

new_game = TicTacToe.new
new_game.start_game
