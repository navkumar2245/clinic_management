class Clinic < ApplicationRecord
    has_many :users
    has_many :appointments
    has_many :inventory_items
end
