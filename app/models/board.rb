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

    @squares = [[],[],[],[],[],[],[],[],[]]
    @cells.each_slice(3).each_with_index do |three, index|
      col =  ((index) % 3) + 1
      row = (index / 9) + 1
      @squares[(col * row) - 1].concat three
    end
  end

end
