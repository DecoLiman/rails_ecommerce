class Admin::BaseController < ApplicationController
  
  private

  def check_admin_user
    unless current_user && current_user.admin?
      flash[:warning] = "Access Denied for this action."
      redirect_to root_url
    end
  end
end
