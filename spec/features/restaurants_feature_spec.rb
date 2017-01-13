require 'rails_helper'


  RSpec.feature "restaurant", type: :feature do
    context "No restaurants have been added yet" do
      scenario "it should display a link to add a restaurant" do
        visit("/restaurants")

        expect(page).to have_content("No restaurants yet")
        expect(page).to have_link("Add restaurant")
      end
    end

      context "Add restaurant" do

        before do
          Restaurant.create(name: "KFC")
        end

        scenario "display restaurant" do
          visit("/restaurants")

          expect(page).to have_content("KFC")
          expect(page).not_to have_content("No restaurants yet")
        end
      end

      context "create a new restaurant" do
        scenario "user can create a new restaurant" do

          visit("/restaurants")
          click_link("Add restaurant")
          fill_in("Name", with: "KFC")
          click_button("Create restaurant")

          expect(current_path).to eq("/restaurants")
          expect(page).to have_content("KFC")
        end
      end
  end



  #     context "displaying restaurant" do
  #       before do
  #         Restaurant.create(name: "KFC")
  #       end
  #
  #       scenario "can see restaurant details" do
  #         visit("/restaurants")
  #         click_link("KFC")
  #
  #         expect(current_page).to eq("/restaurants")
  # end
