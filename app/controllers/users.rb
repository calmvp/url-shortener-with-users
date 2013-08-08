get '/' do
  if current_user
    @user_urls = User.find_user_urls(current_user.id)
  end
  @urls = Url.order('created_at DESC')
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

get '/:short_url' do
 @clicked_url = Url.find_url(params[:short_url])
 @clicked_url.click_count += 1
 @clicked_url.save
 @address = @clicked_url.long_name
  redirect "#{@address}"
end
