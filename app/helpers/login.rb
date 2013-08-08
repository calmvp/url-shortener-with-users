def login
  @user = User.find_by_email(params[:user][:email])
  if @user.password == params[:user][:password]
    # give_token 
    session[:user_id] = @user.id
  else
    redirect '/'
  end
end
