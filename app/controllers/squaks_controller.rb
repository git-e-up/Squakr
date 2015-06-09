class SquaksController < ApplicationController

  def create
    squak = Squak.create( squak_params )
    squak.user = current_user
    squak.save
    redirect_to "/profile"
  end

  def destroy
    Squak.destroy(params[:id])
    redirect_to "/profile"
  end

  def index
    @squaks = Squak.all
  end

  def show
    @squak = Squak.find(params[:id])
  end

  private

  def squak_params
    params.require(:squak).permit(:message)
  end
end
