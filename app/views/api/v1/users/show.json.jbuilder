json.extract! @user, :id, :username

json.products @user.products do |product|
  json.extract! product, :id, :name
  product.features.keys.each do |key|
    json.extract! product.features, key
  end
  json.prices product.prices do |price|
    json.extract! price, :currency, :value
  end
end
