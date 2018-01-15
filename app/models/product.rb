class Product < ApplicationRecord
  belongs_to :user
  validates :name, presence: true
  serialize :features
end
