class JotsController < ApplicationController

	http_basic_authenticate_with name: "dhh", password: "secret", except: [:index, :show]

	def index
		@jots = Jot.all
	end

	def show
		@jot = Jot.find(params[:id])
	end

	def new
		@jot = Jot.new
	end

	def edit
		@jot = Jot.find(params[:id])
	end

	def create
		@jot = Jot.new(jot_params)

		if @jot.save
			redirect_to @jot
		else
			render 'new'
		end
	end

	def update
		@jot = Jot.find(params[:id])

		if(@jot.update(jot_params))
			redirect_to @jot
		else
			render 'edit'
		end
	end	

	def destroy
		@jot = Jot.find(params[:id])
		@jot.destroy

		redirect_to jots_path
	end

	private
		def jot_params
			params.require(:jot).permit(:title, :text)
		end
end
