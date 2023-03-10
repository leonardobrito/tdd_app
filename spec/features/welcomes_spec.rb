# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Welcomes', type: :feature do
  scenario 'display welcome message' do
    # visit('/')
    visit(root_path)
    expect(page).to have_content('Welcome!')
  end

  scenario 'check create customer link' do
    visit(root_path)

    expect(page).to have_selector('ul li a')
    expect(find('ul li')).to have_link('Create customer')
  end
end
