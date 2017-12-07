class TasksController < ApplicationController
	def new
	end

	def create
		#render plain: params[:task].inspect
		@task=Task.new(task_params)
		@task.save
		redirect_to @task
	end

	def	show
		@task=Task.find(params[:id])
	end

	def index
		@tasks=Task.all.order(created_at: :desc)

	end

	def edit
		@task=Task.find(params[:id])
	end

	def update
		@task=Task.find(params[:id])

		if @task.update(task_params)
			redirect_to @task
		else 
			render'edit'
		end 
	end

	private

  		def task_params 
  			params.require(:task).permit(:to_do,:description)
		end
end



