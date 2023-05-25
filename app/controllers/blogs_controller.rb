class BlogsController < ApplicationController

  before_action :set_blog, only: [:show, :destroy, :edit, :update]

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
  @blog = Blog.new(blog_params)
  @blog.user_id = current_user.id
  @blog.save
  #@blog = current_user.blogs.build(blog_params)
  redirect_to blogs_path
end

  def show
  end

  def destroy
    @blog.destroy
    redirect_to blogs_path, notice:"ブログを削除しました！"
  end

  def edit
  end

  def update
    if @blog.update(blog_params)
      redirect_to blogs_path, notice: "ブログを編集しました！"
    else
      render :edit
    end
  end

  def confirm
    @blog = Blog.create(blog_params)
    @blog.user_id = current_user.id
    #@blog = current_user.blogs.build(blog_params)
    render :new if @blog.invalid?
  end

  private

  def blog_params
    params.require(:blog).permit(:title, :content, :image, :image_cache)
  end
end

