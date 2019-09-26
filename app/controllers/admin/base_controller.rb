class Admin::BaseController < ApplicationController

  http_basic_authenticate_with name: ENV["ADMIN_NAME"], password: ENV["ADMIN_PASS"]
  
  private

  def check_admin_user
    unless current_user && current_user.admin?
      flash[:error] = "You don't have authorization to perform this action."
      redirect_to root_url
    end
  end
end
