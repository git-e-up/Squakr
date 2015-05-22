class SessionsController < ApplicationController
  def log_in
  user = User.find_by(username: params[:username])
    if user && user.authenticate( params[:password] )
      session[:user_id] = user.id
      redirect_to "/profile"
    else
      redirect_to "/sign_in"
    end
  end

  def log_out
    session[:user_id] = nil
    redirect_to "/sign_in"
  end
end
