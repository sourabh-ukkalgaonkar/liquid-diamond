class Product < ApplicationRecord
  validates :name, :model, :brand, :year, :ram, :external_storage, presence: true
  validates :name, :model, uniqueness: true
end
