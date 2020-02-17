class Product < ApplicationRecord
  validates :name, :model, :brand, :year, :ram, :external_storage, presence: true
  validates :name, :model, uniqueness: true
  YEARS = (2010..2020)

  def self.search(search)
    records = Product.all

    return records if search.blank?
    records = records.where('name LIKE ?', "%#{search[:name]}%") if search[:name].present?
    records = records.where('model LIKE ?', "%#{search[:model]}%") if search[:model].present?
    records = records.where('brand LIKE ?', "%#{search[:brand]}%") if search[:brand].present?
    records = records.where(year: search[:year]) if search[:year].present?
    records = records.where(ram: search[:ram]) if search[:ram].present?
    records = records.where(external_storage: search[:external_storage]) if search[:external_storage].present?

    records
  end
end
