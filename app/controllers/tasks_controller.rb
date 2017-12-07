class TasksController < ApplicationController
	def new
	end

	def create
		#render plain: params[:task].inspect
		@task=Task.new(params.require(:task).permit(:to_do,:description))
		@task.save
		redirect_to @task
	end

	def	show
		@task=Task.find(params[:id])
	end

	def index
		@tasks=Task.all.order(created_at: :desc)

	end
end



