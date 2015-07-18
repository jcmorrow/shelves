class Shelf
  attr_reader :capacity, :row_color, :visibility, :products

  def initialize capacity, row_color, visibility, products = []
    @capacity = capacity
    @row_color = row_color
    @visibility = visibility
    @products = products
  end

  def add product
    raise "Cannot fit product" if product.size > remaining_space
    @products.push(product)
  end

  def remove_product
    @products.pop
  end

  def empty?
    @products.empty?
  end

  def full?
    used_space == @capacity
  end

  def used_space
    return 0 if empty?
    @products.map(&:size).inject { |sum, product_size| sum + product_size }
  end

  def remaining_space
    @capacity - used_space
  end

end