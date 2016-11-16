class UsersController < ApplicationController
before_action :authenticate_user, only: [:edit, :update, :show]

def new
  @user = User.new
end

def create
user_params = params.require(:user).permit([:first_name,:last_name,:email,:password,:password_confirmation])
@user = User.new user_params
if @user.save
  session[:user_id] = @user.id
  redirect_to root_path, notice: "Thank you for Signning up"
else
  render :new
end
end

def edit
@user = User.find params[:id]
end

def update
  @user = User.find params[:id]
 # render plain: "#{@user.full_name}"
 if @user.authenticate(params[:old_password]) && (params[:new_password] ==params[:new_password_confirmation]) && (params[:new_password] !=params[:old_password])
   @user.password = params[:new_password]
   @user.save
   redirect_to posts_path, notice: "Password Updated"
 else
   redirect_to :back, notice: "Wrong Input"
 end
end

def show
  @user = current_user
end

end
