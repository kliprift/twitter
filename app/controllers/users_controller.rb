#post form for user signup
post '/users/signup' do
  @user = User.new(params[:user])
    if @user.save
      session[:user_id] = @user.id
      redirect to "/users/login"
    else
      @errors = @user.errors.full_messages
      erb :"static/index"
    end
end

post '/users/login' do
  @user = User.find_by(email: params[:user][:email]).try(:authenticate, params[:user][:password])
    if @user # @user is found
      session[:user_id] = @user.id
      redirect to "/users/login"
    else # @user = nil, not found
      @errors = "Please check your input"
      erb :"static/index"
    end
  end

get '/users/login' do
  @user = current_user
    if @user
      session[:user_id] = @user.id
      erb :"users/index"
    else
      erb :"static/index"
    end
  end  

get '/users/:user_id/edit' do
  @user = current_user
    if @user
      session[:user_id] = @user.id
      erb :"users/edit"
    end
end

put '/users/:user_id' do

  name = User.find(params[:user_id])
  name.update(params[:user])
  redirect('/users/login')
end



get '/signout' do
  session[:user_id] = nil
  erb :"static/index"
end 





