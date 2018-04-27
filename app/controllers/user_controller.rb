class UserController < ApplicationController

  # def user
  # end
  #
  # def index
  # end
  # def new
  #   # @user = User.new
  # end
  def create
  #  @user = User.new(params[:un],params[:pw],params[:fname],params[:lname])
    cookies[:un] = params[:un]
    cookies[:pw] = params[:pw]
    cookies[:fname] = params[:fname]
  end

  def confirmation
    if cookies[:un] == params[:un] && cookies[:pw] == params[:pw]
      flash.now[:notice] = "Your credentials are valid"
      render('/home/homepage')
    else
      flash.now[:alert] = "Your credentails are not valid"
    end
  end

  #
  # def show
  # end
  # def edit
  # end
  # def update
  # end
  # def destroy
  # end
end
