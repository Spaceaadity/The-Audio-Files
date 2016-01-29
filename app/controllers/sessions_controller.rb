class SessionsController < ApplicationController
  def create
  	user = User.find_by_email(params[:session][:email].downcase)
  	if user && user.authenticate(params[:session][:password])
  		session[:user_id] = user.id
  		redirect_to '/songs'
  	else
  		flash[:error] = 'Invalid email/password combination'
  		redirect_to '/main'
  	end
  end

  def destroy
  	session[:user_id] = nil
  	redirect_to '/main'
  end
end
