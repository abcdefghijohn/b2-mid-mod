# Story 3
# As a user,
# When I go to a mechanics show page
# I see their name, years of experience, and names of all rides they’re working on
# And I also see a form to add a ride to their workload
# When I fill in that field with an id of a ride that exists in the database
# And I click submit
# I’m taken back to that mechanics show page
# And I see the name of that newly added ride on this mechanics show page
# Ex:
# Mechanic: Kara Smith
# Years of Experience: 11
# Current rides they’re working on:
# The Frog Hopper
# Fahrenheit
# The Kiss Raise
# Add a ride to workload:
# _pretend_this_is_a_textfield_
#                       Submit
require 'rails_helper'
describe "As a user, when I visit the mechanics show page" do
  describe "I see their name, experience, and all the rides they're working on" do
    it "I also see a form to add a ride to their workload" do
      @mechanic_1 = Mechanic.create(name: "Sam Mills",
                                   exp: 10)
      @mechanic_2 = Mechanic.create(name: "Kara Smith",
                                   exp: 11)
      @ride_1 = @mechanic_2.rides.create(name: "Lightning Racer",
                                rating: 6)
      @ride_2 = @mechanic_1.rides.create(name: "Storm Runner",
                                rating: 8)
      @ride_3 = @mechanic_2.rides.create(name: "The Great Bear",
                                rating: 9)
      MechanicRide.create(mechanic: @mechanic_1, ride: @ride_2)
      MechanicRide.create(mechanic: @mechanic_2, ride: @ride_1)
      MechanicRide.create(mechanic: @mechanic_2, ride: @ride_3)

      visit "/mechanics/#{@mechanic_1.id}"
      expect(page).to have_content(@mechanic_1.name)
      expect(page).to have_content(@mechanic_1.exp)
      expect(page).to have_content(@ride_2.name)
      expect(page).to have_content("Add a ride to workload")

      fill_in "Add a ride to workload", with: "#{@ride_1.name}"
      click_on "Submit"

      expect(page).to have_content(ride_1.name)
    end
  end
end
