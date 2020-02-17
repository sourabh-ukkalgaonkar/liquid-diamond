# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Product, type: :model do
  let!(:product) do
    Product.create(
      name: 'New',
      model: 'sp',
      brand: 'Armstrong',
      year: 2013,
      ram: 0.8e1,
      external_storage: 0.96e2
    )
  end
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:model) }
  it { should validate_presence_of(:brand) }
  it { should validate_presence_of(:year) }
  it { should validate_presence_of(:ram) }
  it { should validate_presence_of(:external_storage) }
  it { should validate_uniqueness_of(:name) }
  it { should validate_uniqueness_of(:model) }

  describe 'Class Methods' do
    it 'should return all products when search attribute blank' do
      expect(Product.search({}).count).to be(Product.count)
    end

    it 'should return all products when name is valid' do
      expect(Product.search(name: product.name)).to eq([product])
    end

    it 'should return all products when model is valid' do
      expect(Product.search(model: product.model)).to eq([product])
    end

    it 'should return all products when brand is brand' do
      expect(Product.search(brand: product.brand)).to eq([product])
    end

    it 'should return all products when year is valid' do
      expect(Product.search(year: product.year)).to eq([product])
    end

    it 'should return all products when ram is valid' do
      expect(Product.search(ram: product.ram)).to eq([product])
    end

    it 'should return all products when external_storage is valid' do
      expect(Product.search(external_storage: product.external_storage)).to eq([product])
    end
  end
end
