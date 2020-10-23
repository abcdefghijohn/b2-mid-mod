class Park < ApplicationRecord
  has_many :rides

  validates_presence_of :name
  validates_presence_of :admission

  def ride_avg_rating
    self.rides.average(:rating)
  end
end
