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

      scenario "user can give restaurant a description" do
          visit("/restaurants")
          click_link("Add restaurant")
          fill_in("Name", with: "KFC")
          fill_in("Description", with: "Deep fried goodness")
          click_button("Create restaurant")
          click_link("KFC")
          expect(page).to have_content("Deep fried goodness")
      end

    context "editing restaurant" do

      before do
        Restaurant.create(name: "KFC", description: "Deep fried goodness")
      end

      scenario "user can edit a restaurant" do
        visit("/restaurants")
        click_link("Edit KFC")
        fill_in("Name", with: "Nandos")
        click_button("Update restaurant")
        expect(page).to have_content("Nandos")
        expect(page).not_to have_content("KFC")
      end

    end

    context "delete restaurant" do
    
      before do
        Restaurant.create(name: "KFC", description: "Deep fried goodness")
      end

      scenario "Allows user to delete restaurant" do
        visit("/restaurants")
        click_link("Delete KFC")

        expect(page).to have_content("Restaurant has been successfully deleted")
        expect(page).not_to have_content("KFC")
        expect(current_path).to eq("/restaurants")
      end
    end
  end
