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
end
