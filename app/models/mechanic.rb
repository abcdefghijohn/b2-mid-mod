class Mechanic < ApplicationRecord
  has_many :mechanic_rides
  has_many :rides, through: :mechanic_rides

  validates_presence_of :name
  validates_presence_of :exp

  # def rides_being_worked_on
  #   require "pry"; binding.pry
  #   self.rides.pluck(:name)
  # end
end
