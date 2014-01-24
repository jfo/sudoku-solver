require 'spec_helper'

describe Board do

  let(:boardstring) {
    '003020600900305001001806400008102900700000008006708200002609500800203009005010300'
  }
  let(:first_row) { '003020600' }
  let(:first_column) { '090070080' }
  let(:first_square) { '003900001' }

  let(:board) { Board.new(boardstring) }

  describe '#initialize' do
    it 'sets boardstring' do
      expect(board.boardstring).to eql boardstring
    end

    it 'creates cells from boardstring' do
      expect(board.cells.map(&:value).join).to eql boardstring
    end

    it 'creates rows from cells' do
      expect(board.rows.first.map(&:value).join).to eql first_row
    end

    it 'creates columns from cells' do
      expect(board.columns.first.map(&:value).join).to eql first_column
    end

    it 'creates squares from cells' do
      expect(board.squares.first.map(&:value).join).to eql first_square
    end
  end

  describe 'updating a cell' do
    before do
      board.cells.first.value = 10
    end

    it 'updates the cell in cells' do
      expect(board.cells.first.value).to eql 10
    end

    it 'updates the cell in rows' do
      expect(board.cells.first.value).to eql 10
    end
  end

  it 'has 9 squares' do
    expect(board.squares.length).to eql 9
  end


end




