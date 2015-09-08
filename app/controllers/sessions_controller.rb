class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id # This is how to set a hash's key with a value
      redirect_to products_url, notice: "Logged in!" # Q: Where can I see this notice message? Who this message is written for?
    else
      flash.now[:alert] = "Invalid email or password" # Q: It works the same with or withour '.now'
      render "new"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to products_url, notice: "Logged out!"
  end

end
