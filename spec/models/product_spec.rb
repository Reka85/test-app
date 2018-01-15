require 'rails_helper'

RSpec.describe Product, type: :model do
  it 'ensures name presence' do
    user = User.new(username: "Joe")
    product = Product.new(name: '', user: user)
    expect(product).to_not be_valid
  end

  it 'ensures user presence' do
    product = Product.new(name: "adidas")
    expect(product).to_not be_valid
  end

  it 'should save successfully' do
    user = User.new(username: "Joe")
    product = Product.new(name: "adidas", user: user).save
    expect(product).to eq(true)
  end

  it 'deleting user should delete product' do
    user = User.new(username: "Joe")
    product = Product.new(name: "adidas", user: user).save
    expect {user.destroy}.to change { Product.count }.by(-1)
  end

  it 'should add new attribute to features' do
    user = User.new(username: "Joe")
    product = Product.new(name: "adidas", user: user)
    product.features['size'] = 42
    expect(product.features.length).to be(1)
  end
end
