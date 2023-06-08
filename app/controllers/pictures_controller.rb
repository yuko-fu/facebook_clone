class PicturesController < ApplicationController
  before_action :set_picture, only: %i[ show edit update destroy ]
  skip_before_action :login_required

  def index
    @pictures = Picture.all
  end

  def show
    @picture = Picture.find(params[:id])
  end

  def new
    @picture = Picture.new
  end

  def edit
    @picture = Picture.find(params[:id])
  end

  def create
    @picture = Picture.new(picture_params)
    @picture.user_id = current_user.id
    if @picture.save
      redirect_to new_picture_path, notice: "作成しました！"
    else
      render :new
    end
  end

  def confirm
    @picture = Picture.new(picture_params)
    @picture.user_id = current_user.id
    render :new if @picture.invalid?
  end

  def update
    @picture = Picture.find(params[:id])
    if @picture.update(picture_params)
      redirect_to picture_path, notice: "編集しました！"
    else
      render :edit
    end
  end

  def destroy
    @picture.destroy
    redirect_to pictures_path, notice:"削除しました！"
  end

  private

    def picture_params
      params.require(:picture).permit(:image, :image_cache)
    end

    def set_picture
      @picture = Picture.find(params[:id])
    end
end
