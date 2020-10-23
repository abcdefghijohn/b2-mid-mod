# Story 1
# As a user,
# When I visit a mechanics index page
# I see a header saying “All Mechanics”
# And I see a list of all mechanic’s names and their years of experience
# Ex:
#              All Mechanics
#    Sam Mills - 10 years of experience
#    Kara Smith - 11 years of experience
require 'rails_helper'

describe "As a user" do
  describe "When I visit a mechanics index page" do
    it "I see a header and all mechanics and their experience" do
      mechanic_1 = Mechanic.create(name: "Sam Mills",
                                   exp: 10)
      mechanic_2 = Mechanic.create(name: "Kara Smith",
                                   exp: 11)
      visit '/mechanics'
      expect(page).to have_content("All Mechanics")
      expect(page).to have_content(mechanic_1.name)
      expect(page).to have_content(mechanic_1.exp)
      expect(page).to have_content(mechanic_2.name)
      expect(page).to have_content(mechanic_2.exp)
    end
  end
end
