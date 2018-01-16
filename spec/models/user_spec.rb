require 'rails_helper'

RSpec.describe User, type: :model do
  it "ensures username presence" do
    user = User.new(username: "")
    expect(user).to_not be_valid
  end

  it "ensures email presence" do
    user = User.new(username: "Mary", password: "password")
    expect(user).to_not be_valid
  end

  it "ensures password presence" do
    user = User.new(username: "Mary", email: "mary@hamstermail.com", password: "")
    expect(user).to_not be_valid
  end

  it "ensures password length" do
    user = User.new(username: "Mary", email: "mary@hamstermail.com", password: "pass")
    expect(user).to_not be_valid
  end

  it "should save successfully" do
    user = User.new(username: "Mary", email: "mary@hamstermail.com", password: "password").save
    expect(user).to eq(true)
  end

  it "ensures username uniqueness" do
    user = User.new(username: "Joe", email: "joe@hamstermail.com", password: "password").save
    user_invalid = User.new(username: "Joe", email: "joseph@hamstermail.com", password: "password")
    expect(user_invalid).to_not be_valid
  end

  it "ensures email uniqueness" do
    user = User.new(username: "Joe", email: "joe@hamstermail.com", password: "password").save
    user_invalid = User.new(username: "Joseph", email: "joe@hamstermail.com", password: "password")
    expect(user_invalid).to_not be_valid
  end

end
