require 'nokogiri'
require 'open-uri'

require_relative 'cell'

class Board

  attr_reader :boardstring, :cells, :rows, :squares, :columns

  def initialize(boardstring = generate)
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

    @squares = (0...9).map do |square|
      @rows.map do |row|
        row.slice(square, 3)
      end
    end
  end

  def generate
    doc = Nokogiri::HTML(open('http://www.free-sudoku.com/sudoku.php'))

    boardarray = []
    i = 0

    until i == 82
      boardarray << doc.css("##{i}").text
      i+=1
    end

    boardarray.map! do |cell|
      if cell == ''
        cell = '0'
      else
        cell = cell
      end
    end

    boardarray.join
  end

end
