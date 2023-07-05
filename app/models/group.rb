class Group < ApplicationRecord
  belongs_to :user
  has_many :operation, dependent: :destroy
end
