class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  helper_method :current_user

  private

  def require_login
    unless current_user
      flash[:danger] = "You must be logged in to continue."
      redirect_to login_url
    end
  end

  def check_session
    if current_user.present?
      flash[:warning] = "You are already logged in."
      redirect_to '/'
    end
  end

  def cart
    # value = cookies[:cart] || JSON.generate({})
    @cart ||= cookies[:cart].present? ? JSON.parse(cookies[:cart]) : {}
  end
  helper_method :cart

  def update_cart(new_cart)
    cookies[:cart] = {
      value: JSON.generate(new_cart),
      expires: 10.days.from_now
    }
    cookies[:cart]
  end

end
