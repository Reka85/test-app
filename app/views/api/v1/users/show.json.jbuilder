json.extract! @user, :id, :username

json.products @user.products do |product|
  json.extract! product, :id, :name
  json.extract! product.features, :size
  json.prices product.prices do |price|
    json.extract! price, :currency, :value
  end
end
