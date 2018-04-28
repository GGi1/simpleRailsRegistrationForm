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
  @user = User.new(params[:un],params[:pw],params[:email],params[:fname],params[:lname], params[:city], params[:state], params[:zip],params[:country])
  # @user1 = @user.each { |x| puts x }
  # @user.attributes.each_pair do |name, value|
  #   puts "#{name} = #{value}"
  # end
  file = File.new("users.txt", "w+")
  #file.write("[#{@user.un}, #{@user.pw}, #{@user.fname}, #{@user.lname}]")
  # @user1 = @user.each { |x| puts x }
  file.write("#{@user.un},#{@user.pw},#{@user.email},#{@user.fname},#{@user.lname},#{@user.other}")
#  file.write("#{@user}")
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
    @testthing = @userArray.each { |x| puts x }
    # if @userName == params[:un] && @userPass == params[:pw]
        if @userPass == params[:pw]
        #Send flash notice
        flash.now[:notice] = "You're A FUCKING BOSS (aka credentials are valid)"
        #
        file = File.new("user_list.txt", "a")
        file.write("#{@testthing} \n")
        file.close
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
