enable :sessions

get '/signup' do
p 'hello'
  erb :signup
end

post '/signup' do
  @user = User.create(params[:user])
  session[:user] = @user
  session[:user_id] = @user.id
  if @user.id.nil?
    redirect to '/signup'
  else
    redirect to "/users/#{session[:user_id]}"
  end
end

get '/users/:id' do
  @url = Url.where("user_id = ?", current_user)
  erb :user
end

post '/users/:id' do
  User.find_by_id(current_user).urls.create(params[:url])
  redirect to "/users/#{params[:id]}"
end