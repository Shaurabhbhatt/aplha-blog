class PhotosController < ApplicationController
  before_action :require_user,only: [:index,:new]
  def new
    @photo = Photo.new
    @photo.user = User.last;
  end
  def index
    @user = current_user
    @photos = Photo.where(user_id: @user.id)
  end
  
  def create  
    @user = User.last
    
    if params[:photo] != nil
      params[:photo][:image].each do |a|
     
      @photo = @user.photos.create!(:image => a)
      end
       flash[:success] =  "pictures uploaded successfully"
      redirect_to photos_path
    else
      flash[:danger] = "No pictures are selected"
       redirect_to upload_path(Photo.new)
    end
   
  end
  
  def destroy 
    
  end
  
   private
   def post_params
      params.require(:photo).permit(:image)
   end
  
end