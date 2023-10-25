class Director < ApplicationRecord
  has_many :movies

  validates :name, presence: true
  validates :name, length: 5..20
end
