class UsersController < ApplicationController
  def new
  end

  def create
  	@user = User.new(user_params)
  	if @user.save
  		session[:user_id] = @user.id
  		flash[:notice] = "You have successfully registered! Please login."
  		redirect_to "/main"
  	else
  		flash[:reg_errors] = @user.errors.full_messages
  		redirect_to "/main"
  	end
  end

  def show
  	@user = User.find(params[:id])
  	@playlist = Playlist.joins(:song).select('title', 'artist', 'songs.id').group('songs.id').where(user: User.find(params[:id]))
  	@addCount = Playlist.where(user: User.find(params[:id]))
  end

  private
  	def user_params
  		params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  	end
end
