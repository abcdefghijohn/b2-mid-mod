class Ride < ApplicationRecord
  belongs_to :park

  validates_presence_of :name
  validates_presence_of :rating
end
