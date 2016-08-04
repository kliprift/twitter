get '/users/:user_id/tweets/new' do
  erb :"tweets/new"
end

post '/users/:user_id/tweets' do 
  @user = User.find(params[:user_id])  
  @tweet = @user.tweets.new(params[:tweet])
    if @tweet.save
      redirect to '/users/login'
    else 
      @errors = @tweet.errors.full_messages
    erb :"tweets/new"
  end
end


delete '/tweets/:id' do
  tweet = Tweet.find(params[:id])
  tweet.destroy
  redirect to "/users/login"
end
