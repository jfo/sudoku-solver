# require 'puzzlegen'

class Board

  attr_reader :boardstring, :cells, :rows, :squares, :columns

  def initialize(boardstring)
    @boardstring=boardstring
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

    @squares = (0...9).map do |square|
      @rows.map do |row|
        row.slice(square, 3)
      end
    end
  end

end
