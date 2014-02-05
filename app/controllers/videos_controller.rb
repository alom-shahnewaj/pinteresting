class VideosController < ApplicationController
  def index
  	@videos = Video.all.order("created_at DESC").paginate(:page => params[:page], :per_page => 12)
  end

  def new
  	@v = current_user.videos.build
  end

  def create
    @v = current_user.videos.build(video_params)
    if @v.save
      flash[:notice] = 'video was successfully created.'
      redirect_to video_params
    else
      render action: 'new'
    end
  end

  def show
  	
  end

  private

  	def video_params
  		params.require(:video).permit(:description, :video) 
  	end

end
