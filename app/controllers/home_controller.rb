class HomeController < ApplicationController

def index

end

def about

end

def reset

end

def confirm
 @user = User.find_by_email(params[:email])
 if @user

 else
   redirect_to reset_home_path
 end
end

def change
@user = User.find params[:subaction]
# render plain: "#{@user.full_name}"
if(params[:new_password] ==params[:new_password_confirmation])
  @user.password = params[:new_password]
  @user.sign_in_fails = 0
  @user.save
  redirect_to new_session_path, notice: "Password Updated"
else
  redirect_to reset_home_path, notice: "New passwords did not match"
end
end

end
