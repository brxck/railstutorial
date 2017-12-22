module SessionsHelper
  
  # Logs in the given user.
  def log_in(user)
    # Creates a temporary cookie
    # Permanent cookies with the cookie method require more care
    session[:user_id] = user.id
  end

  # Returns the current logged-in user (if any).
  def current_user
    # Conditiona assignment lets us query the database only once.
    @current_user ||= User.find_by(id: session[:user_id])
    # #find_by returns nil when a user doesn't exist,
    # while #find raises an exception.
  end

  def logged_in?
    !current_user.nil?
  end

  # Logs out the current user.
  def log_out
    session.delete(:user_id)
    @current_user = nil
  end
end
