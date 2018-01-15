require 'rails_helper'

RSpec.describe User, type: :model do
  it "ensures username presence" do
    user = User.new(username: "")
    expect(user).to_not be_valid
  end

  it "should save successfully" do
    user = User.new(username: "Mary").save
    expect(user).to eq(true)
  end

  it "ensures username uniqueness" do
    user = User.new(username: "Joe").save
    user_new = User.new(username: "Joe")
    expect(user_new).to_not be_valid
  end
end
