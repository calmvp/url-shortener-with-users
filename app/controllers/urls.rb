
get '/error' do
  erb :error
end

post '/urls' do
  if current_user
    @url = current_user.urls.build(long_name: params[:user_input])
  else
    @url = Url.new_url(params)
  end
  if @url.valid?
    @url.save
  else
    redirect '/error'
  end
  redirect '/'
end

