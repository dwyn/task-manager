class SessionsController < ApplicationController
  
    def new
        @user = User.new
    end

    def create
        @user = User.find_by(username: params[:user][:username])
        binding.pry
        if @user && @user.authenticate([:user][:password])
            session[:user_id] = user.id
            redirect_to user_path(user)
        else
            flash[:message] = "Incorrect login"
            redirect_to '/login'
        end
    end

    def destroy
        session.clear
        redirect_to '/'
    end

end