class SessionsController < ApplicationController

	# def signup
	#     @user = User.new(user_params)
	#     if @user.save
	#       render json: @user, status: :created
	#     else
	#       render json: @user.errors, status: :unprocessable_entity
	#     end
	# end

	def login
		user = User.find_by(email: params[:email])
		#user = User.find(:email)

		if user && user.password == params[:password]
			token = encode_user_data({user_data: user.id})

			render json: {token:token}
		else
			render json: {message: "invalid credentials"}
		end
	end
end
