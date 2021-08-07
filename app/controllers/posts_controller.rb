class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def edit
  end

  def show
  end
  
  def create
  end
  
  def update
  end
  
  def destroy
  end

  Private
  def post_params
    params.require(:post).permit(:title, :content, :image, :image_cache)
  end

end
