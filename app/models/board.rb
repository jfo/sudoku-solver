class Board

  attr_reader :boardstring, :cells, :rows, :squares, :columns

  def initialize(boardstring)
    @boardstring = boardstring
    @boardstring = '000000000111111111222222222333333333444444444555555555666666666777777777888888888'
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
