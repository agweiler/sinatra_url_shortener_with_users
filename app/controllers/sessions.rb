enable :sessions

post '/login' do
  #if validated
p  @user = User.authenticate(params[:user][:email], params[:user][:password])

  if @user.nil?
    erb :signup
  else
    session[:user] = @user
    session[:user_id] = @user.id
    # erb :secret
    redirect to "/users/#{@user.id}"
  end
end

get '/logout' do
  session.clear
  redirect to '/'
end