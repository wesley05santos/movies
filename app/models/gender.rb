class Gender < ApplicationRecord
  has_many :movies

  validates :description, presence: true
end
