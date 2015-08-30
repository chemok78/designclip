class ClipsController < ApplicationController
  before_action :set_clip, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]
  before_action :correct_user, only: [:edit, :update, :destroy]

  def index
    @clips = Clip.all
  end

  def show
  end

  def new
    @clip = current_user.clips.build #through user, not through Clips model
  end

  def edit
  end

  def create
    @clip = current_user.clips.build(clip_params)

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
    
    def correct_user
      @clip = current_user.clips.find_by(id: params[:id])
      redirect_to clips_path, notice: "You dont have authorization to edit this clip" if @clip.nil?
    end


    def clip_params
      params.require(:clip).permit(:description)
    end
end
