require 'product'
describe Product do
  let(:product) { Product.new(10, 5, "My New Product") }
  it 'has a value, size and a name' do
    expect(product).to have_attributes(size: 10, value: 5, name: "My New Product")
  end

  it 'has a value density' do
    expect(product.value_density).to eq(0.5)
  end

end