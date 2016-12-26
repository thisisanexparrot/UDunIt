class JotsController < ApplicationController
	def index
	end

	def show
		@jot = Jot.find(params[:id])
	end

	def new
	end

	def create
		@jot = Jot.new(article_params)

		@jot.save
		redirect_to @jot
	end

	private
		def article_params
			params.require(:jot).permit(:title, :text)
		end
end
