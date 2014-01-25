require 'pry'
require 'nokogiri'
require 'open-uri'
module BoardHelper

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

include BoardHelper
binding.pry


