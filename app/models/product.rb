class Product < ApplicationRecord
  belongs_to :user
  validates :name, presence: true
  serialize :attributes
end
