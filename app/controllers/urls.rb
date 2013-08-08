

# get '/error' do
#   erb :error
# end

post '/urls' do
  # create a new Url
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


# get '/:short_url' do
#  @clicked_url = Url.find_url(params[:short_url])
#  @clicked_url.click_count += 1
#  @clicked_url.save
#  @address = @clicked_url.long_name
#   redirect "#{@address}"
# end
