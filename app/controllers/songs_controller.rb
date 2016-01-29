class SongsController < ApplicationController
  def index
  	@user = User.find(session[:user_id])
  	@songs = Song.all
  	@counts = Playlist.all
  end

  def create
  	@song = Song.new(song_params)
  	if @song.save
  		flash[:notice] = "New song has been added"
  		redirect_to '/songs'
  	else
  		flash[:song_errors] = @song.errors.full_messages
  		redirect_to "/songs"
  	end
  end

  def update
  	Playlist.create(user: User.find(session[:user_id]), song: Song.find(params[:id]))
  	redirect_to '/songs'
  end

  def show
  	@song = Song.find(params[:id])
  	@ownes = Playlist.joins(:user).select('first_name', 'last_name', 'users.id').group('users.id').where(song: Song.find(params[:id]))
  	@ownCount = Playlist.where(song: Song.find(params[:id]))
  end

  private
  	def song_params
  		params.require(:song).permit(:title, :artist)
  	end
end
