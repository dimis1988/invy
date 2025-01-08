class ProductCategoriesController < ApplicationController
    def index
      @product_categories = ProductCategory.all
    end
  
    def show
      @product_category = ProductCategory.find(params[:id])
    end
  
    def new
      @product_category = ProductCategory.new
    end
  
    def create
      @product_category = ProductCategory.new(product_category_params)
        if @product_category.save
          redirect_to product_category_url(@product_category), notice: "Category was successfully created." 
        else
         render :new, status: :unprocessable_entity
        end
    end
  
    def edit
      @product_category = ProductCategory.find(params[:id])
    end
  
    def update
      @product_category = ProductCategory.find(params[:id])
        if @product_category.update(product_category_params)
          redirect_to product_category_url(@product_category), notice: "Category was successfully updated." 
        else
          render :edit, status: :unprocessable_entity 
        end
    end
  
    def destroy 
      @product_category = ProductCategory.find(params[:id])
      @product_category.destroy 
      redirect_to product_categories_path, notice: "Category was successfully deleted." 
    end
    
    private
  
    def product_category_params
      params.require(:product_category).permit(:sku, :name, :description)
    end

  
end
