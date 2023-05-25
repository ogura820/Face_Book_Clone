class BlogsController < ApplicationController

  before_action :set_blog, only: [:show, :destroy]

  def set_blog
    @blog = Blog.find(params[:id])
  end

  def index
    @blogs = Blog.all
  end

  def new
    @blog = Blog.new
  end

  def create
    Blog.create(blog_params)
    redirect_to new_blog_path
  end

  def show
  end

  def destroy
    @blog.destroy
    redirect_to blogs_path, notice:"ブログを削除しました！"
  end

  private

  def blog_params
    params.require(:blog).permit(:title, :content, :image)
  end
end

