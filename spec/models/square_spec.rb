require 'spec_helper'

describe Square do

  let(:square) { Square.new }

  it 'has 9 cells' do
    expect(square.cells.length).to eql 9
  end

end
