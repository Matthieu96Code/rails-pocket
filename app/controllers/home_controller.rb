class HomeController < ApplicationController
  before_action :authenticate_user!

  def categories
    @categories = current_user.categories.includes(:operations)
  end
end