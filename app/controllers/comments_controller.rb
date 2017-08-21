class CommentsController < ApplicationController

  def index

  end

  def new
    @comment = Comment.new
  end

  def create
    @post = Post.find_by_id(:post_id)
    @comment = Comment.new(comment_params)

    if @comment.save
      redirect_to 'posts_path(@post)'
    else
      redirect_to '/posts'
    end
  end

  def show
    @comment = Comment.find_by_id(params[:id])
  end

  def edit

  end

  def update

  end

  def destroy

  end

  private

  def comment_params
    params.require(:comment).permit(:content, :post_id, :user_id)
  end

end
