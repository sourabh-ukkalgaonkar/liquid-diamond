require 'rails_helper'

RSpec.describe ProductsController, type: :controller do
  let(:product_attributes) do
    {
      name: "New",
      model: "sp",
      brand: "Armstrong",
      year: 2013,
      ram: 0.8e1,
      external_storage: 0.96e2
    }
  end

  let!(:product) {
    Product.create(
      name: "New1",
      model: "sp1",
      brand: "Armstrong",
      year: 2013,
      ram: 0.8e1,
      external_storage: 0.96e2
    )
  }

  describe 'new#action' do
    it 'should return login template' do
      get :new
      expect(response).to render_template('new')
    end
  end

  describe 'create#action' do
    it 'should create a product' do
      post :create, params: { product: product_attributes }
      expect(response).to redirect_to(product_path(assigns(:product)))
    end

    it 'should not create a product' do
      post :create, params: { product: product_attributes.except(:name) }
      expect(response).to render_template('new')
    end
  end

  describe 'show#action' do
    it 'should find a product' do
      get :show, params: { id: product.id }
      expect(response).to render_template('show')
    end

    it 'should not find a product' do
      get :show, params: { id: 'dd' }
      expect(response).to redirect_to(products_path)
    end
  end

  describe 'destroy#action' do
    it 'should destroy product' do
      delete :destroy, params: { id: product.id }
      expect(response).to redirect_to(products_path)
    end
  end

  describe 'export#action' do
    it 'should export a xlsx file' do
      get :export, params: { product: product_attributes }, format: :xlsx
      expect(response.status).to be(200)
    end
  end
end
