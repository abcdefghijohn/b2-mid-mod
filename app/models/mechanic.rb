class Mechanic < ApplicationRecord
  validates_presence_of :name
  validates_presence_of :exp
end
