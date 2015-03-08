class CategoriesController < ApplicationController
  before_action :set_category, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @categories = Category.all
  end

  def show
    @products = @category.products
  end

  def new
    @category = Category.new
  end

  def edit
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      respond_to do |format|
        format.html { redirect_to @category, notice: "Category successfully created." }
        format.json { render :show, status: :created, location: @category }
      end
    else
      format.html { render :new }
    end
  end

  def update
    @category.update(category_params)
  end

  def destroy
    @category.destroy
  end

  private
    def set_category
      @category = Category.includes(:products).find(params[:id])
    end

    def category_params
      params.require(:category).permit(:name)
    end
end
