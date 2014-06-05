helpers do

  def current_user
    # TODO: return the current user if there is a user signed in.
    if session[:user_id]
    	@current_user ||= User.find_by_id(session[:user_id])
    end
  end

  def logged_in?
    !current_user.nil?
  end

end