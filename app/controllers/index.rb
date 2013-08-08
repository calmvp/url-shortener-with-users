get '/' do
  # Look in app/views/index.erb

  erb :index
end

get '/logout' do

  session[:user_id] = nil
  redirect '/'
end

post '/login' do
  
  login
  redirect "/"
end

post '/logup' do

  @user = User.log_up_new_user(params[:user])
  login
  redirect "/"
end
