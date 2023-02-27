require 'rails_helper'

RSpec.feature 'Customers', type: :feature do
  scenario 'check create customer link' do
    visit(root_path)
    expect(page).to have_link('Create customer')
  end

  scenario 'check create customer link navigation' do
    visit(root_path)
    click_link('Create customer')

    expect(page).to have_content('Listing customers')
    expect(page).to have_link('New customer')
  end

  scenario 'check if navigate to new customer form page' do
    visit(customers_path)
    click_link('New customer')

    expect(find('h1')).to have_content('New customer')
  end

  scenario 'create a valid customer' do
    visit(new_customer_path)

    fill_in('Name', with: Faker::Name.name)
    fill_in('Email', with: Faker::Internet.email)
    fill_in('Phone', with: Faker::PhoneNumber.phone_number)
    attach_file('Avatar', "#{Rails.root}/spec/fixtures/avatar.png")
    choose(option: %w[Yes No].sample)

    expect do
      click_on('Create customer')
    end.to change(Customer, :count).by(1)

    expect(page).to have_content('Customer was successfully created')
  end
end
