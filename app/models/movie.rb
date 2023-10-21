class Movie < ApplicationRecord
  belongs_to :director
  belongs_to :gender

  validates :title, :release_year, :synopsis, :country_of_origin, :duration, :director_id, :gender_id, presence: true
end
