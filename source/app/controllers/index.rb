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
      redirect to('/')
    else
      erb :failed_login
    end
  end
end

get '/sessions/:id' do
	session.clear
	redirect to('/')
  # sign-out -- invoked 
end

#----------- USERS -----------

get '/users/new' do
  # render sign-up page
  erb :sign_up
end

post '/users' do
  # sign-up a new user
  User.create(name: params[:name], email: params[:email], password: params[:password])
  redirect to('/')
end