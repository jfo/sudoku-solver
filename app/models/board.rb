class Board

  attr_reader :boardstring, :cells, :rows, :squares, :columns

  def initialize(boardstring)
    @boardstring = boardstring
    @boardstring = '000000000111111111222222222333333333444444444555555555666666666777777777888888888'
    @boardstring = '619030040270061008000047621486302079000014580031009060005720806320106057160400030'
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

    i=0
    square_index = 0

    3.times do
      @rows[i..(i + 2)].each do |this|
        this[0..2].each {|e| squares[square_index] << e}
      end
      @rows[i..(i + 2)].each do |this|
        this[3..5].each {|e| squares[square_index + 1] << e}
      end
      @rows[i..(i + 2)].each do |this|
        this[6..8].each {|e| squares[square_index + 2] << e}
      end
      i += 3
      square_index += 3

    end
  end
end
