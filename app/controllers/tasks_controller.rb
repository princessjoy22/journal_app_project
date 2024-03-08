class TasksController < ApplicationController
    before_action :set_category, only: [:index, :create, :new]
    before_action :set_task, only: [:show, :edit, :update, :destroy]

    def index
        @tasks = @category.tasks
    end

    def show
    end

    def new
       @task = @category.tasks.build
    end

    def edit
    end

    def create
        @task = @category.tasks.build(task_params)
        
        if @task.save
            redirect_to category_path(@category), notice: "Task was successfully created."
        else
            render :new
        end
    end

    def update
        if @task.update(task_params)
            redirect_to category_path(@category), notice: "Task was successfully updated."
        else
            render :edit
        end
    end

    def destroy
        @task.destroy
            redirect_to category_path(@category), notice: 'Task was successfully destroyed.'
    end

    private
        def set_category
            @category = current_user.categories.find(params[:category_id])
        end

        def task_params
            params.require(:task).permit(:title, :description, :date)
        end

        def set_task
            @category = current_user.categories.find(params[:category_id])
            @task = @category.tasks.find(params[:id])
        end



end
