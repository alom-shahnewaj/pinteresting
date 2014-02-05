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
      redirect_to @v
    else
      render action: 'new'
    end
  end

  def show
  	@v = Video.find(params[:id])
  end

  def edit
    @v = Video.find(params[:id])
  end

  def update
    @v = Video.find(params[:id])
    if @v.update(video_params)
      redirect_to @v, notice: 'Video was successfully update'
    else
      render action: 'edit'
    end
  end

  def destroy
    @v = Video.find(params[:id])
    @v.destroy
    redirect_to videos_path
  end

  private

  	def video_params
  		params.require(:video).permit(:description, :video) 
  	end

end
