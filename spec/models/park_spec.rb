require 'rails_helper'

RSpec.describe Park, type: :model do
  describe 'validations' do
    it {should validate_presence_of :name}
    it {should validate_presence_of :admission}
  end

  describe '.ride_avg_rating' do
    it "can get average rating of rides of a park" do
      park = Park.create(name: "Hershey Park",
                         admission: "$50.00")
      ride_1 = park.rides.create(name: "Lightning Racer",
                           rating: 6)
      ride_2 = park.rides.create(name: "Storm Runner",
                           rating: 8)

      expect(park.ride_avg_rating).to eq(7)
    end
  end
end
