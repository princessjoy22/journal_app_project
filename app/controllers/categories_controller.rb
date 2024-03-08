class CategoriesController < ApplicationController
    before_action :authenticate_user!
    before_action :set_category, only: [:show, :edit, :update, :destroy]

    def index
        @categories = current_user.categories
    end

    def show
        @categories = current_user.categories
        @category = Category.find(params[:id])
        @tasks = @category.tasks
        unless @category.user == current_user
            redirect to root_path, alert: "Category not found"
        end
    end

    def new
        @category = current_user.categories.build
    end

    def edit
        @categories = current_user.categories
    end

    def create
        @category = current_user.categories.build(category_params)

        if @category.save
            redirect_to category_path(@category),
            notice: "Category was successfully created."
        else
            render :new
        end
    end
    
    def update
        if @category.update(category_params)
            redirect_to @category, notice: "Category was successfully updated."
        else
            render :edit
        end
    end

    def destroy
        @category.destroy
            redirect_to categories_path, notice: "Category was successfully destroyed."
    end

    private

        def category_params
            params.require(:category).permit(:name)
        end

        def set_category
            @category = current_user.categories.find_by(id: params[:id])
        end
end
