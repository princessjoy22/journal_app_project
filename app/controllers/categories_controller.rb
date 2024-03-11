class CategoriesController < ApplicationController
    before_action :set_category, only: [:show, :edit, :update, :destroy]

    def index
        @categories = current_user.categories
    end

    def show
        @tasks = @category.tasks
    end

    def new
        @category = current_user.categories.build
    end

    def edit
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
