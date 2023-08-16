class Restaurant < ApplicationRecord
  validates :name, presence: true

  has_many :reviews, dependent: :destroy
end

# List all the reviews to that @restaurant
# get all the review instances that has restuarant_id of @restaurant.id
# Review.where(restuarant_id: @restaurant.id)
