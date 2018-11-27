class Board
  attr_accessor :cells

  def initialize
    self.reset!
  end

  def reset!
    @cells = [" "] * 9
  end

  def display
    board = ""
    @cells.each_with_index do |item, index|
      if [0,3,6].include?(index)
         board << " #{@cells[index]}"
      elsif [2,5,8].include?(index)
         board << "#{@cells[index]} \n"
         board << "-----------\n"
      else
         board << " | #{@cells[index]} | "
      end
    end
    puts board
  end

  def position(user_input)
    @cells[user_input.to_i-1]
  end

  def update(position, player)
    # position 1-9 strings, player = Player obj
    # set the board equal to the token
    @cells[position.to_i-1] = player.token
  end

  def full?
    @cells.none?{|obj| obj == " "}
  end

  def turn_count
    @cells.reject{|c| c == " "}.size
  end

  def taken?(user_input)
    @cells[user_input.to_i-1] != " "
  end

  def valid_move?(move)
    ["1","2","3","4","5","6","7","8","9"].include?(move) && !taken?(move)
  end
end
