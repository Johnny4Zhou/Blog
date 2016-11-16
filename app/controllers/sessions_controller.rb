class SessionsController < ApplicationController

  def new

  end

  def create
    user = User.find_by_email params[:email].downcase
    if user && user.authenticate(params[:password])
      user.sign_in_fails = 0
      user.save
      session[:user_id] = user.id
      redirect_to root_path,
      notice: 'Signed In'
    else
      user.sign_in_fails+=1
      user.save
      if user.sign_in_fails >=10
        redirect_to reset_home_path, notice: "Please enter email to reset password"
      else
        flash.now[:alert] = 'Wrong Credentials'
        render :new
      end
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, notice: 'Signed Out!'
  end

end
