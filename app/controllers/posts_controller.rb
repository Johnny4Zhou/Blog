class PostsController < ApplicationController
before_action :authenticate_user, except: [:index, :show]

before_action :authorize_access, only: [:edit, :update, :destroy]

POSTS_PER_PAGE = 10

  def new
    @post = Post.new
  end



  def create
    post_params = params.require(:post).permit([:title, :body, :category_id])
    @post=Post.new post_params
    @post.user = current_user
    if @post.save
      redirect_to post_path(@post)
    else
      render :new
    end
  end

  def show
    @comment = Comment.new
    @post = Post.find params[:id]

    # render plain: "In show action"
  end

  def index
    @posts = Post.order(created_at: :desc).order(created_at: :desc).
                          page(params[:page]).
                          per(POSTS_PER_PAGE)
  end

  def edit
    @post = Post.find params[:id]
  end

  def update
    # render plain: "in update action"
     @post = Post.find params[:id]
     post_params = params.require(:post).permit([:title, :body, :category_id])
     if @post.update post_params
     redirect_to post_path(@post)
    else
      render :edit
    end
  end

  def destroy
    @post = Post.find params[:id]
    @post.destroy
    redirect_to posts_path

  end

private
def authorize_access
  unless can? :manage, @post
      # head :unauthorized # this will send an empty HTTP response with 401 code
      redirect_to root_path, alert: 'access denied'
  end
end
end
