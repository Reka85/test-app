require 'rails_helper'

RSpec.describe Price, type: :model do
  it 'ensures currency presence' do
    user = User.new(username: "Joe")
    product = Product.new(name: "adidas", user: user)
    price = Price.new(currency: "", value: "54")
    expect(price).to_not be_valid
  end

  it 'ensures value presence' do
    user = User.new(username: "Joe")
    product = Product.new(name: "adidas", user: user)
    price = Price.new(currency: "Eur", value: "")
    expect(price).to_not be_valid
  end

  it 'ensures product presence' do
    price = Price.new(currency: "Eur", value: "")
    expect(price).to_not be_valid
  end

  it 'should save successfully' do
    user = User.new(username: "Joe")
    product = Product.new(name: "adidas", user: user)
    price = Price.new(currency: "Eur", value: "54", product:product).save
    expect(price).to eq(true)
  end
end
