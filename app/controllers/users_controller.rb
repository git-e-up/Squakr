class UsersController < ApplicationController

  def index
    @users = User.all
  
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new  # teach the form how to be

  end
  def create
      user = User.create( user_params )
      # if (@user != nil)
      redirect_to "/sign_in"
    # else
    # redirect_to "/users/#{ user.id }"
    #   redirect_to "/users/new",
    #   error: "Your username must be between 6-20 characters"
    # end

  end

  def edit
    @user = User.find(params[:id])
  end
  def update
    user = User.find(params[:id])
    user.update!( user_params )
    redirect_to "/users/#{ user.id }"
  end

  def destroy
    User.destroy(params[:id])
    redirect_to "/users"
  end

  def profile
    authenticate!
    @user = current_user
    @squak = Squak.new
    @squaks = Squak.all
  end

  def sign_in # Render a sign-in form
  end

  # def squaks
  #   user.squaks
  # end

  private

  def user_params
    params.require(:user).permit(:username, :password)
  end
end
