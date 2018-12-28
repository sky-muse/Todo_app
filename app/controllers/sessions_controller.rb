class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(params_user)
    if user && user.authenticate(params[:session][:password])
      log_in user
      redirect_to tasks_path, success: 'ログインに成功しました'
    else
      flash.now[:danger] = 'ログインに失敗しました'
      render :new
    end
  end

  def destory
    log_out
    redirect_to root_path, success: 'ログアウトしました'
  end

  private
  def log_in user
    session[:user_id] = user.id
  end

  def params_user
    params.require(:session).permit(:email)
  end

  def log_out
    session.delete(:user_id)
    @current_user = nil
  end
end
