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

#----------- USERS -----------

get '/user/new' do
  # render sign-up page
  erb :sign_up
end

post '/user' do
  # sign-up a new user
  User.create(username: params[:username], email: params[:email], password: params[:password])
  redirect to('/')
end
