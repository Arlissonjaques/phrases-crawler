class Api::UserController < ApplicationController
  before_action :set_user

  def login
    if @user && @user.authenticate(user_params[:password])
      render json: { 
        sucess: true, 
        access_token: token_generate(@user.id), 
        errors: [] 
      }, status: :ok
    else
      render json: { 
        sucess: false, 
        access_token: '',
        errors: ['incorrect username or password'] 
      }, status: :not_found
    end
  end

  private

  def user_params
    params.permit(:email, :password)
  end

  def set_user
    @user = User.find_by(email: user_params[:email])
  end
end
