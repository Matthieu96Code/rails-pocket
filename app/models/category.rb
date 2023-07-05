class Category < ApplicationRecord
  belongs_to :user
  has_many :category_operations
  has_many :operations, through: :category_operations
end
