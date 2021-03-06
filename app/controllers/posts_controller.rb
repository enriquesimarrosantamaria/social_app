class PostsController < ApplicationController
  def new
    @post=Post.new
  end

  def index
    @posts=Post.all
  end

  def show
    @post=Post.find(params[:id])
  end

  def create
    @post=Post.new(permit_post)
    if @post.save
      flash[:success] = "Success creating!!"
      redirect_to post_path(@post)
    else
      flash[:error] = @post.errors.full_messages
      redirect_to new_post_path
      end
  end

  def delete
    if @post.delete
      flash[:success] = "Success deleting!!"
      redirect_to post_path(@post)
    else
      flash[:error] = @post.errors.full_messages
      end
  end

  private
    def permit_post
      params.require(:post).permit(:image,:description)
    end
end
