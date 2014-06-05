get '/' do
  # render home page
 #TODO: Show all users if user is signed in
 	@users = User.all
  erb :index
end

#----------- SESSIONS -----------

get '/sessions/new' do
  # render sign-in page
  erb :sign_in
end

post '/sessions' do
  # sign-in
  u = User.find_by_email params[:email]
  if u.nil?
    erb :failed_login
  else
    if u.password == params[:password]
      session[:user_id] = u.id
      redirect to("/user/#{u.username}")
    else
      erb :failed_login
    end
  end
end

get '/sessions/:id' do
	session.clear
	redirect ('/')
  # sign-out -- invoked
end

#----------- USERS -----------

get '/user/:username' do
  @user = User.find_by_username(params[:username])
  @tweets = @user.tweets
  erb :user
end

post '/user/:username' do
  @user = User.find_by_username(params[:username])
  @user.tweets << Tweet.create!(content: params[:content])
  redirect "/user/#{@user.username}"
end

