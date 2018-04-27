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
  @user = User.new(params[:un],params[:pw],params[:fname],params[:lname])
  file = File.new("users.txt", "w+")
  # file.write("[#{@user.un}, #{@user.pw}, #{@user.fname}, #{@user.lname}]")
  file.write("#{@user.un},#{@user.pw},#{@user.fname},#{@user.lname},")
# w is write only
# r+  read-write starts at beginning
# w+  read-write and overwrites existing data (or creates new)
# a: write only append to end of tile if exists, creates new file if not
#a+ : read-write, appends or reads from end of file
# r : read only
  file.close

# ALT: File.open("file.txt, w+"){
# |file| file.puts("some text")
# }

    cookies[:un] = params[:un]
    cookies[:pw] = params[:pw]
    cookies[:fname] = params[:fname]
  end

  def confirmation
    # if cookies[:un] == params[:un] && cookies[:pw] == params[:pw]
    #   flash.now[:notice] = "Your credentials are valid"
    #   render('/home/homepage')
    # else
    #   flash.now[:alert] = "Your credentails are not valid"
    # end

    #-----------------------------------------------------------------------------------------
    # file = File.open("users.txt", "r")
    #READS ENITRE FILE:

    @readallfile = File.read("users.txt")

    @userArray = @readallfile.split(",")
    @userName = @userArray[0]
    @userPass = @userArray[1]
    # if @userName == params[:un] && @userPass == params[:pw]
        if @userPass == params[:pw]
        flash.now[:notice] = "You're A FUCKING BOSS (aka credentials are valid)"
        render('/home/homepage')
      else
      flash.now[:alert] = "Your credentails are not valid. '#{@userPass}' (userPass) !=  '#{params[:pw]}' (params[:pw])"
      render('/user/confirmation')
    end

    # READS LINE BY LINE, returns contents as an array:
    # @userArray = File.readlines("users.txt").each{
    #   |line| puts "--- #{line}"
    # }
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
