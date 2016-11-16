class FavouritesController < ApplicationController
  before_action :authenticate_user

def create
  post = Post.find params[:post_id]
  favourite = Favourite.new(user: current_user, post: post)

  if cannot? :favor, post
    redirect_to :bcak, notice: "Access Denied"
  elsif favourite.save
    redirect_to :back, notice: "Thanks for favoring"
  else
    redirect_to :back, alert: favourite.errors.full_messages.join(", ")
  end
end

def destroy
  favourite = Favourite.find params[:id]
  if favourite.destroy
    redirect_to :back, notice: "💔💔💔💔💔💔💔💔💔💔💔💔💔💔💔💔💔💔💔💔💔💔💔💔💔💔💔💔💔💔"
  else
    redirect_to :back, alert: favourite.errors.full_messages.join(", ")
  end
end

end
