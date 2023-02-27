class Customer < ApplicationRecord
  validates :name, presence: true
  validates :email, presence: true
  validates :phone, presence: true
  validates :avatar, presence: true
  validates :smoke, presence: true
end
