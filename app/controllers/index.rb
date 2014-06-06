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
  u = User.find_by_username params[:username]
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

#----------- REGISTER -----------

get '/user/new' do
  # render sign-up page
  erb :sign_up
end

post '/user' do
  # sign-up a new user
  # User.create(username: params[:username], email: params[:email], password: params[:password])
  u = User.new
  u.username = params[:username]
  u.email = params[:email]
  u.password = params[:password]
  u.save!
  redirect to('/')
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



#------Search-------

post '/search' do
  @username = params[:search]
  if (User.find_by_username(@username).nil?)
    redirect to("/")
  else
    @username = User.find_by_username(@username).username
    @found = true
    redirect to("/user/#{@username}")
  end

end