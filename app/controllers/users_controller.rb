class UsersController < ApplicationController
    # before_action :authenticate_user, except: [:new, :create]
    
    def new
      @user = User.new
    end
    
    def create
      @user = User.new(user_params)
      if @user.save
        session[:user_id] = @user.id
        redirect_to categories_path
      else
        render :new
      end
    end
    
    private
    
    def user_params
      params.require(:user).permit(:fname, :email, :password)
    end
    
    def authenticate_user
      redirect_to login_path unless current_user
    end
  end
  