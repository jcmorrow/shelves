class Product
  attr_reader :name, :size, :value, :quantity

  def initialize size, value, name
    @size = size
    @value = value
    @name = name
  end

  def value_density
    @value.to_f/@size.to_f
  end


end