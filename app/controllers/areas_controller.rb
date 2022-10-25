class AreasController < ApplicationController

	def index
	    @areas = Area.all
	    render json: @areas
  	end

	def create
		@user = User.find(params[:user_id])
		@area = @user.areas.create(area_params)
		if @area.save
	      render json: @area, status: :created
	    else
	      render json: @area.errors, status: :unprocessable_entity
	    end
	end

	    
		# if @user.areas.create(area_params) 
	 #      render json: @area, status: :created
	 #    else
	 #      render json: @area.errors, status: :unprocessable_entity
	 #    end

	def destroy
	    @user = User.find(params[:user_id])
	    @area = @user.comments.find(params[:id])
	    @area.destroy
	    head :no_content
	end

	private
		def area_params
		  params.require(:area).permit(:type, :geoloc)
		end

end
