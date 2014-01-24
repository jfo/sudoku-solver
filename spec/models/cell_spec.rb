require 'spec_helper'

describe Cell do

  let(:cell) { Cell.new }

  it 'has an default value of 0' do
    expect(cell.value).to eql 0
  end

  it 'can be set to a value' do
    cell.value = 1
    expect(cell.value).to eql 1
  end

  it 'accepts an initial value' do
    expect(Cell.new('derple').value).to eql 'derple'
  end

end
