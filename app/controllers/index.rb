get '/' do
  # let user create new short URL, display a list of shortened URLs
  @urls = Url.order('created_at DESC')
  erb :index
end

get '/error' do
  erb :error
end

post '/urls' do
  # create a new Url
  @url = Url.new_url(params)
  if @url.valid?
    @url.save
  else
    redirect '/error'
  end
  redirect '/'
end

# e.g., /q6bda
get '/:short_url' do
 @clicked_url = Url.find_url(params[:short_url])
 @clicked_url.click_count += 1
 @clicked_url.save
 @address = @clicked_url.long_name
  redirect "#{@address}"
end
