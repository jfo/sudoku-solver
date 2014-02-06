require 'spec_helper'

describe Board do

  let(:boardstring) {
    '000000000111111111222222222333333333444444444555555555666666666777777777888888888'
  }
  let(:first_row) { '000000000' }
  let(:first_column) { '012345678' }
  let(:first_square) { '000111222' }

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
      expect(board.squares.first.flatten.map(&:value).join).to eql first_square
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




