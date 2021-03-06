# frozen_string_literal: true

class ProductsController < ApplicationController
  before_action :set_product, only: %i[show edit update destroy]

  def index
    @products = Product.search(params[:search])
                       .paginate(per_page: 25, page: params[:page])
  end

  def show; end

  def new
    @product = Product.new
  end

  def edit; end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to @product, notice: 'Product was successfully created.'
    else
      render :new
    end
  end

  def update
    if @product.update(product_params)
      redirect_to @product, notice: 'Product was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @product.destroy
    redirect_to products_url, notice: 'Product was successfully destroyed.'
  end

  def export
    @products = Product.search(params[:search])
                       .paginate(per_page: 25, page: params[:page])

    respond_to do |format|
      format.xlsx { render xlsx: 'export', filename: 'products.xlsx' }
    end
  end

  private

  def set_product
    @product = Product.find_by_id(params[:id])
    redirect_to products_path if @product.blank?
  end

  def product_params
    params.require(:product).permit(:name, :model, :brand, :year, :ram, :external_storage)
  end
end
