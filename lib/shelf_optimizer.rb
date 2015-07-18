class ShelfOptimizer
  attr_reader :products, :shelves

  def initialize(products, shelves)
    @products = products
    @shelves = shelves
  end

  def most_visible_shelf
     visibility_sorted_shelves.first
  end

  def most_valuable_product_by_size
     value_density_sorted_products.first
  end

  def smallest_product
    @products.sort { |a, b| a.size <=> b.size } .first
  end

  def value_density_sorted_products
    @products.sort { |a, b| b.value_density <=> a.value_density }
  end

  def visibility_sorted_shelves
    @shelves.sort { |a, b| b.visibility <=> a.visibility }
  end

  def shelves_full?
    @shelves.each do |shelf|
      return false if shelf_has_room? shelf
    end
    return true
  end

  def optimize_all_shelves
    raise "No products" if @products.empty?
    raise "Shelves full" if shelves_full?
    visibility_sorted_shelves.each do |shelf|
      optimize_shelf shelf
    end
  end

  def optimize_shelf shelf
    return if shelf.full? || @products.empty?
    value_density_sorted_products.each do |product|
      if(product.size <= shelf.remaining_space)
        shelf.add(product)
        @products = @products - [product]
      end
    end
  end

  def shelf_has_room? shelf
    !shelf.full? && (shelf.remaining_space > smallest_product.size)
  end

  def present
    presentation = ""
    visibility_sorted_shelves.each do |shelf|
      presentation << "\n((#{shelf.capacity}))"
      shelf.products.each do |product|
        presentation << "|#{product.name}(#{product.value})|"
      end
    end
    return presentation
  end
end