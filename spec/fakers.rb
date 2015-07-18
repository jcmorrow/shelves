require 'faker'
require 'product'
require 'shelf'

module Fakers
  def faked_product
    Product.new(Faker::Number.between(1,10),
                Faker::Number.between(1,5),
                Faker::Commerce.product_name )
  end

  def faked_shelf
    Shelf.new(Faker::Number.between(1,50),
              Faker::Commerce.color,
              Faker::Number.between(0.01, 0.9))
  end
end