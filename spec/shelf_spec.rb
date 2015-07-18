require 'shelf'

describe Shelf do
  let(:shelf) { Shelf.new(45, "Red", 0.8) }
  it 'has a capacity, visibility, and a color' do
    expect(shelf).to have_attributes(capacity: 45, row_color: "Red", visibility: 0.8)
  end

  it 'can have a product added to it' do
    product = double("product", size: 1)
    
    shelf.add(product)

    expect(shelf.products).to include(product)
  end

  it 'can have a product removed from it' do
    product = double("product", size: 1)
    
    shelf.add(product)
    shelf.remove_product

    expect(shelf).to be_empty
  end

  it 'can tell if it is full' do
    product = double("product", size: 5)
    9.times { shelf.add(product) }

    expect(shelf.full?).to be(true)
  end

  it 'raises an error if it cannot fit the assigned product' do
    product = double("product", size: 5)
    9.times { shelf.add(product) }

    expect { shelf.add(product) } .to raise_error
  end

end