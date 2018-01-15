class Price < ApplicationRecord
  belongs_to :product
  validates :currency, presence: true
  validates :value, presence: true
end
