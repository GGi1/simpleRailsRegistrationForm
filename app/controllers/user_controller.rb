class UserController < ApplicationController

  def create
  @user = User.new(params[:un],params[:pw],params[:email],params[:fname],params[:lname], params[:city], params[:state], params[:zip],params[:country])
  file = File.new("users.txt", "w+")
  file.write("#{@user.un},#{@user.pw},#{@user.email},#{@user.fname},#{@user.lname},#{@user.other}")
  file.close
  end

  def confirmation
    #READS ENITRE FILE:
    @readallfile = File.read("users.txt")
    @userArray = @readallfile.split(",")
    @userName = @userArray[0]
    @userPass = @userArray[1]
    @testthing = @userArray.each { |x| puts x }
      if @userPass == params[:pw]
        #Send flash notice
        flash.now[:notice] = "Your credentials are valid"
        #Save user into user_list.txt
        file = File.new("user_list.txt", "a")
        file.write("#{@testthing} \n")
        file.close
        render('/home/homepage')
      else
      flash.now[:alert] = "Your credentails are not valid."
      render('/user/confirmation')
    end
  end
end
