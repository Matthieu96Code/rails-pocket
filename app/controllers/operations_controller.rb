class OperationsController < ApplicationController
  before_action :authenticate_user
  
  def new
    @operation = Operation.new
    @operations = current_user.operations
  end
  
  def create
    @operation = current_user.operations.build(operation_params)
    if @operation.save
      redirect_to group_path(@operation.group_id)
    else
      @groups = current_user.groups
      render :new
    end
  end
  
  private
  
  def operation_params
    params.require(:operation).permit(:name, :amount, :group_id)
  end
  
  def authenticate_user
    redirect_to login_path unless current_user
  end
end
