class CategoriesController < ApplicationController
    before_action :authenticate_user!
  
    def new
      @category = current_user.categories.build
    end
  
    def create
      @category = current_user.categories.build(category_params)
      if @category.save
        redirect_to root_path, notice: 'Category created successfully.'
      else
        render :new
      end
    end
  
    private
  
    def category_params
      params.require(:category).permit(:name, :icon)
    end
  end
  