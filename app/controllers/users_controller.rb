class UsersController < ApplicationController
  before_action :set_user, only: %i[update show destroy]
  
  def index
    @users = User.all
    render json: @users
  end
  def show
    render json: @user
  end
  def create
    @user = User.new(user_params)
    if @user.save
      token = encode_user_data({user_data: @user.id})
      render json: { token: token }
      #render json: @user, status: :created
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end
  def update
    @user.update(user_params)
    head :no_content
  end
  def destroy
    @user.destroy!
    head :no_content
  end

  private
	def set_user
		@user = User.find(params[:id])
	end
	def user_params
		params.require(:user).permit(:email, :password, :name)
	end

end
