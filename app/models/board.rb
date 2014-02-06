require_relative 'cell'

class Board

  attr_reader :boardstring, :cells, :rows, :squares, :columns

  def initialize(boardstring)
    @boardstring = boardstring
    setup
  end

  private

  def setup
    @cells = @boardstring.split(//).map do |value|
      Cell.new(value)
    end

    @rows = @cells.each_slice(9).to_a

    @columns = (0..9).map do |column|
      @cells.select.with_index { |_,x| x % 9 == column }
    end

    @squares = [[],[],[],[],[],[],[],[],[]]



    @rows[0..2].each do |this|
      this[0..2].each {|e| squares[0] << e}
    end
    @rows[0..2].each do |this|
      this[3..5].each {|e| squares[1] << e}
    end
    @rows[0..2].each do |this|
      this[6..8].each {|e| squares[2] << e}
    end

    @rows[3..5].each do |this|
      this[0..2].each {|e| squares[3] << e}
    end
    @rows[3..5].each do |this|
      this[3..5].each {|e| squares[4] << e}
    end
    @rows[3..5].each do |this|
      this[6..8].each {|e| squares[5] << e}
    end

    @rows[6..8].each do |this|
      this[0..2].each {|e| squares[6] << e}
    end
    @rows[6..8].each do |this|
      this[3..5].each {|e| squares[7] << e}
    end
    @rows[6..8].each do |this|
      this[6..8].each {|e| squares[8] << e}
    end

  end

end








































    # index = 0
    # until index == 3
    #   i = 0
    # until i == 3

    #   3.times do
    #   @squares[index] << @boardstring[i]
    #   i += 1
    #   end

    # i += 9
    # end
    # index += 27
    # end

    # # @cells.each_with_index do |cell, index|
    # #   square_row = index / 27

    # # square_rows.each do |board|
    # #   index = 0
    # #   i = 0
    # #   until index == 3
    # #     @squares << []
    # #     until i == 3
    # #       @squares << board[index][i]
    # #       i +=1
    # #     end
    # #     index += 1
    # #   end
    # # end

