# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.destroy_all

user_attributes = {
  username: "joe",
  email: "joe@hamstermail.com",
  password: "password"
}

user = User.new(user_attributes)
user.save!

p "Created user"

product_names = ["adidas", "nike", "puma"]

colors = ["red", "grey", "blue", "green", "black"]

product_names.each do |name|
  product = Product.new(name: name, user: user)
  product.features["color"] = colors.sample
  product.features["size"] = rand(36..48)
  product.save!
end

p "Created products"


Product.all.each do |product|
  dollar_price = Price.new(product: product, currency: "Dollar", value: rand(35..60))
  euro_price = Price.new(product: product, currency: "Euro", value: rand(35..60))
  dollar_price.save!
  euro_price.save!
end

p "Created prices"
User.create!(username: "admin_user", email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?
