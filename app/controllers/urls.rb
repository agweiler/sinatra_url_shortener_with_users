post '/urls' do
  # create a new Url
p current_user
  if current_user.nil?
    Url.create(params[:url])
  else
    User.find_by_id(current_user).urls.create(params[:url])
  end
  # Url.create(params[:url])
  redirect to ("/#{params[:url][:short]}")
end

# e.g., /q6bda
get '/:short_url' do
  pass if request.path_info == "/signup"
  pass if request.path_info == "/signin"
  pass if request.path_info == "/logout"
  pass if request.path_info == "/login"

  @go_to = Url.where('short = ?', params[:short_url]).first
  @go_to.update_attributes( click_count: @go_to.click_count += 1 )
  redirect to ( @go_to.original )

  # redirect to appropriate "long" URL
end