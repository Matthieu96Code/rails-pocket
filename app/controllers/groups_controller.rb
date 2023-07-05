class GroupsController < ApplicationController
  before_action :authenticate_user
  
  def index
    @groups = current_user.groups
  end
  
  def show
    @group = current_user.groups.find(params[:id])
    @operations = @group.operation.order(created_at: :desc)
  end
  
  def new
    @group = Group.new
  end
  
  def create
    @group = current_user.groups.build(group_params)
    if @group.save
      redirect_to groups_path
    else
      render :new
    end
  end
  
  private
  
  def group_params
    params.require(:group).permit(:name, :icon)
  end
  
  def authenticate_user
    redirect_to login_path unless current_user
  end
end
