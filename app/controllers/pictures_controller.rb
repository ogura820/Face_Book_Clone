class PicturesController < ApplicationController

  before_action :set_picture, only: [:show, :destroy, :edit, :update]

  def set_picture
    @picture = Picture.find(params[:id])
  end

  def index
    @pictures = Picture.all
  end

  def new
    @picture = Picture.new
  end

def create
  @picture = Picture.new(picture_params)
  @picture.user_id = current_user.id
  @picture.save
  #@picture = current_user.pictures.build(picture_params)
  redirect_to pictures_path
end

  def show
  end

  def destroy
    @picture.destroy
    redirect_to pictures_path, notice:"ブログを削除しました！"
  end

  def edit
  end

  def update
    if @picture.update(picture_params)
      redirect_to pictures_path, notice: "ブログを編集しました！"
    else
      render :edit
    end
  end

  def confirm
    @picture = Picture.create(picture_params)
    @picture.user_id = current_user.id
    #@picture = current_user.pictures.build(picture_params)
    render :new if @picture.invalid?
  end

  private

  def picture_params
    params.require(:picture).permit(:title, :content, :image, :image_cache)
  end
end

