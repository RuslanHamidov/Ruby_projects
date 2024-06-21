# MasterMind is a code-breaking game where player or computer sets a sequence of colors,
# and the other player attempts to guess the correct sequence within a limited number of tries

class MasterMind
  @@colors = ['red', 'green', 'blue', 'yellow', 'brown', 'orange', 'black', 'white']
    def initialize
      @board = []
      @code = []
      @wrong_spot = []
      @@tries = 12
    end

    def start
      puts 'Press 1 to be a player or 2 to be a host'
      choice = gets.chomp.to_i
      if choice == 1
        self.start_game_player
      elsif choice == 2
        self.start_game_computer
      else
        puts 'Invalid choice'
      end
    end

    private
    def start_game_computer
      @guess = {}
      last_move = []
      flag = true
      puts 'MasterMind game has started as a host'
      puts "Enter colors to guess for a computer choose from #{@@colors}"
      self.put_code(@board)
      while flag do
        @code.clear
        puts "\nYou have tries: #{@@tries}"
        if @@tries == 0
          puts "Sorry you lost colors were #{@board}"
          break
        end
        if @wrong_spot.length == 4
          @code = @wrong_spot.to_a.sort{ rand() - 0.5 }[0...4]
        else
          @code = @@colors.to_a.sort{ rand() - 0.5 }[0...4]
        end
        last_move = @code
        self.computer_move(last_move)
        flag = check_win
        @@tries -= 1
      end
    end

    private
    def start_game_player
      @board = @@colors.to_a.sort{ rand() - 0.5 }[0...4]
      puts 'MasterMind game has started as a player'
      flag = true
      while flag do
        @code.clear
        puts "\nYou have tries: #{@@tries}"
        if @@tries == 0
          puts "Sorry you lost colors were #{@board}"
          break
        end
        puts "Enter code choose from this colors #{@@colors}"
        put_code(@code)
        flag = check_win
        @@tries -= 1
      end
    end

    private
    def put_code(array)
      4.times do
        code = gets.chomp.to_s
        array.push(code)
      end
      array
    end

    private
    def computer_move(move)
        move.each_with_index do |color, index|
            if color == @board[index]
              @guess[index] = color
            elsif @board.include?(color)
              @wrong_spot.push(color)
              @wrong_spot.uniq!
            end
        end
      @guess.each { |key, value| @code[key] = value}
    end

    private
    def check_win
      guess = []
      @code.each_with_index do |color, index|
            if color == @board[index]
              guess.push(1)
            elsif @board.include?(color)
              guess.push(0)
            else
              guess.push(-1)
            end
        end
        if guess.all? { |num| num == 1 }
          puts "Congrats you guessed right #{@board}"
          return false
        end
        guess = guess.sort.reverse
        print guess
        guess.clear
        true
      end

end

game = MasterMind.new
game.start
