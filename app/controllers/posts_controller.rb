class PostsController < ApplicationController

  def index
    @posts = Post.all
  end

  def show
    @post = Post.find_by_id(params[:id])
    @comments = @post.comments
  end

  def new
    @post = Post.new
  end

  def create
    user = User.find_by_id(session[:user_id])
    post = user.posts.create(post_params)
    redirect_to post_path(post)
  end

  def edit
    @post = Post.find_by_id(params[:id])
  end

  def update
    @post = Post.find_by_id(params[:id])
    @post.update(post_params)
    redirect_to post_path(@post)
  end

  def destroy

  end

  private

  def post_params
    params.require(:post).permit(:id, :title, :content)
  end
end
