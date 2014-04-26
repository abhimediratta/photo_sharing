class SharedAlbumsController < ApplicationController

  # GET /shared_albums/1
  # GET /shared_albums/1.json
  def show
    @shared_album = SharedAlbum.find(SharedAlbum.decrypt(params[:id]))
    @user=@shared_album.user
    @photos=@user.photos
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @shared_album }
    end
  end

end
