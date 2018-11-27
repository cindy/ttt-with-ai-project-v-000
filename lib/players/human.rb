module Players
  class Human < Player

    def move(board)
      puts "Make a move"
      position = gets
      #board.update(position, self)
      position
    end
  end
end
