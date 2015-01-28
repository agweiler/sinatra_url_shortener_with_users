get '/' do
  # Look in app/views/index.erb
  @url = Url.where("user_id IS NULL")
  erb :index
end
