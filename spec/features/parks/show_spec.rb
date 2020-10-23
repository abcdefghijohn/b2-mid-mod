# Story 2
# As a visitor,
# When I visit an amusement park’s show page
# I see the name and price of admissions for that amusement park
# And I see the names of all the rides that are at that park
# And I see the average thrill rating of this amusement park’s rides
# Ex: Hershey Park
#    Admissions: $50.00
#
#    Rides:
#           1. Lightning Racer
#           2. Storm Runner
#           3. The Great Bear
#    Average Thrill Rating of Rides: 7.8/10
require 'rails_helper'

describe "As a visitor, when I visit a park's show page" do
  describe "I see the admission price and name of the park" do
    it "I see the name of all rides at the park and average ride rating" do
      park = Park.create(name: "Hershey Park",
                         admission: "$50.00")
      ride_1 = Ride.create(name: "Lightning Racer",
                           rating: 6)
      ride_2 = Ride.create(name: "Storm Runner",
                           rating: 8)
      ride_3 = Ride.create(name: "The Great Bear",
                           rating: 9)
      visit "/parks/#{park.id}"

      expect(page).to have_content(park.name)
      expect(page).to have_content(park.admission)

      expect(page).to have_content(ride_1.name)
      expect(page).to have_content(ride_2.name)
      expect(page).to have_content(ride_3.name)
      expect(page).to have_content(park.ride_avg_rating)

    end
  end
end
