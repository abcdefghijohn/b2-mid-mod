class Ride < ApplicationRecord
  belongs_to :park

  has_many :mechanic_rides
  has_many :mechanics, through: :mechanic_rides
  
  validates_presence_of :name
  validates_presence_of :rating
end
