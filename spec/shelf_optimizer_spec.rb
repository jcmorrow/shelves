require 'shelf_optimizer'
require_relative './fakers'

RSpec.configure do |c|
  c.include Fakers
end

describe ShelfOptimizer do
  let(:products) do
    Array.new.tap do |array| 
      50.times { array.push(faked_product) }
    end
  end
  let(:shelves) do
    Array.new.tap do |array| 
      5.times { array.push(faked_shelf) }
    end
  end
  let(:shelf_optimizer) { ShelfOptimizer.new(products, shelves) }


  it 'has some products and shelves' do
    expect(shelf_optimizer).to have_attributes(products: products, shelves: shelves)
  end

  it 'can find the most visible shelf' do
    very_visible_shelf = double("shelf", visibility: 10)
    shelf_optimizer.shelves.push(very_visible_shelf)

    expect(shelf_optimizer.most_visible_shelf).to be(very_visible_shelf)
  end

  it 'can find the most valuable product by area' do
    very_valuable_product = double("valuable product", value_density: 1000)
    shelf_optimizer.products.push(very_valuable_product)

    expect(shelf_optimizer.most_valuable_product_by_size).to be(very_valuable_product)
  end

  it 'can tell when all shelves are full' do
    shelves = [Shelf.new(50, "black", "1")]
    products = Array.new.tap do |array| 
                10.times { array.push(Product.new(5, 10, "Filling Product")) }
              end
    shelf_optimizer = ShelfOptimizer.new(products, shelves)
    

    10.times do
      shelf_optimizer.most_visible_shelf.add shelf_optimizer.most_valuable_product_by_size
    end

    expect(shelf_optimizer.shelves_full?).to be(true)

  end

  it 'can optimize itself' do
    shelf_optimizer.optimize_all_shelves
    puts shelf_optimizer.present
  end

end