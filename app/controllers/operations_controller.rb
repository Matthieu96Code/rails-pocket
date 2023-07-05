class OperationsController < ApplicationController
    before_action :authenticate_user!
    before_action :set_category
  
    def index
      @operations = @category.operations.order(created_at: :desc)
      @total_amount = @category.operations.sum(:amount)
    end
  
    def new
      @operation = @category.operations.build
    end
  
    def create
      @operation = @category.operations.build(operation_params)
      if @operation.save
        redirect_to category_operations_path(@category), notice: 'Operation created successfully.'
      else
        render :new
      end
    end
  
    private
  
    def set_category
      @category = current_user.categories.find(params[:category_id])
    end
  
    def operation_params
      params.require(:operation).permit(:name, :amount)
    end
  end
  