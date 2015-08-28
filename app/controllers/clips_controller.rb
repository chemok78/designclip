class ClipsController < ApplicationController
  before_action :set_clip, only: [:show, :edit, :update, :destroy]

  def index
    @clips = Clip.all
  end

  def show
  end

  def new
    @clip = Clip.new
  end

  def edit
  end

  def create
    @clip = Clip.new(clip_params)

      if @clip.save
       redirect_to @clip, notice: 'Clip was successfully created.' 
      else
       render :new 
      end
  end

  def update
      if @clip.update(clip_params)
        redirect_to @clip, notice: 'Clip was successfully updated.' 
        
      else
       render :edit 
      end
  end

  def destroy
    @clip.destroy
    redirect_to clips_url, notice: 'Clip was successfully destroyed.' 
  end

  private
    def set_clip
      @clip = Clip.find(params[:id])
    end


    def clip_params
      params.require(:clip).permit(:description)
    end
end
