class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in user # uses our method from sessions_helper
      redirect_to user
    else
      # flash.now makes sure that the flash is displayed after rendering, 
      # not after the next http request.
      flash.now[:danger] = 'Invalid email/password combination'
      render :new
    end
  end

  def destroy
    log_out
    redirect_to root_url
  end
end
