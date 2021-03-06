# Create a new user
get '/users/new' do
  erb:'users/new'
end

# Register a new user
post '/users' do
  @user = User.new(params[:user])

  if @user.save
    login(@user)
    redirect "users/#{@user.id}"
  else
    redirect "/users/new"
  end
end

# User Profile page
get '/users/:id' do
  @user = User.find(params[:id])
  erb:'users/show'
end


# if request.xhr?

#   content_type :json
#   {id: user_id}.to_json
# else

# end