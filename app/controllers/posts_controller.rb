class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
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
    @post = Post.new(post_params)
    redirect_to new_post_path
  end
  
  def update
  end
  
  def destroy
  end

  private
  def post_params
    params.require(:post).permit(:title, :content, :image, :image_cache)
  end

  def set_post
    @post = Post.find(params[:id])
  end
end
