class GoalsController < ApplicationController

	http_basic_authenticate_with name: "dhh", password: "secret", only: :destroy

	def create
		@jot = Jot.find(params[:jot_id])
		@goal = @jot.goals.create(goal_params)
		redirect_to jot_path(@jot)
	end

	def destroy
		@jot = Jot.find(params[:jot_id])
		@goal = @jot.goals.find(params[:id])
		@goal.destroy
		redirect_to jot_path(@jot)
	end

	private
		def goal_params
			params.require(:goal).permit(:name, :description)
		end
end
