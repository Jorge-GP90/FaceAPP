class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  include PostsHelper
  def index
    @posts = Post.all
  end

  def new
    if params[:back]
      @post = current_user.posts.new(post_params)
    else
      @post = current_user.posts.new
    end
  end

  def edit
  end

  def show
  end
  
  def create
    @post = current_user.posts.build(post_params)
    if params[:back]
      render :new
    else
      if @post.save
      redirect_to posts_path(current_user.id), notice: "new post created"
      else
        render :new
      end
    end
  end
  
  def update
    if @post.update(post_params)
      redirect_to posts_path, notice: "post edited"
    else
      render :edit
    end
  end
  
  def destroy
    @post.destroy
    redirect_to user_path(current_user.id), notice:"I deleted the post"
  end

  def confirm
    @post = current_user.posts.build(post_params)
    render :new if @post.invalid?
  end

  private
  def post_params
    params.require(:post).permit(:title, :content, :image, :image_cache)
  end

  def set_post
    @post = Post.find(params[:id])
  end
end
