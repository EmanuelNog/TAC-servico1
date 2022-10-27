class SessionsController < ApplicationController

	def login
		# find_by e utilizado pois ele retorna nulo se nao encontrar nada,
		# mas o find retorn um exception, fica mais facil pra fazer o if.
		user = User.find_by(email: params[:email])
		# user = User.find(:email)

		if user && user.password == params[:password]
			token = encode_user_data({user_data: user.id})

			render json: {token:token}
		else
			render json: {message: "invalid credentials"}
		end
	end
end
