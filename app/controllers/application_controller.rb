class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  add_flash_types :success, :info, :warning, :danger
  helper_method :current_user, :logged_in?

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def logged_in?
    current_user.present?
  end

  def authenticate_user
    if current_user == nil
      flash[:danger]= 'ログインが必要です'
      redirect_to root_path
    end
  end

  # def params_scheduled_end_date
  #   @scheduled_end_date =
  #     params[:task]["scheduled_end_date(1i)"].to_i,
  #     params[:task]["scheduled_end_date(2i)"].to_i,
  #     params[:task]["scheduled_end_date(3i)"].to_i
  # end

end
