class CategoriesController < ApplicationController

  def index
    @categories = Category.all
  end

  def show
  end

  def new
    @category = Category.new
  end


  def create
    @category = Category.new(category_params)

      if @category.save
        redirect_to categories_url, notice: "Category was successfully created."
      else
        redirect_to categories_path, alert: "Failed to create new category"
      end
  end

  def destroy
    category = Category.find(params[:id])

    if category.destroy!
      flash[:notice] = 'Category deleted!'
      redirect_to categories_path
    else
      flash[:alert] = 'Failed to delete category!'
    end 
  end  

  private
    def set_category
      @category = Category.find(params[:id])
    end

    def category_params
      category = params.require(:category).permit(:name, :icon, :user_id)
      category[:user_id] = current_user.id
      category
    end
end
