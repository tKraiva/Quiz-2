class IdeasController < ApplicationController

    before_action :authenticate_user!, except: [:index, :show]
    before_action :find_product, only: [:show, :edit, :update, :destroy]

    def new
      @idea = Idea.new
    end
  
    def create
      @idea = Idea.new idea_params
      if @idea.save
        flash[:notice] = "Idea created successfully"
        redirect_to @idea
        # same as redirect_to product_path(@product)
      else
        # render will simply render the new.html.erb view in the views/products
        # directory. The #new action above will not be touched.
        render :new
      end
    end
  
    def index
    
      @ideas = Idea.order(created_at: :DESC)
    end
  
    def show
    end
  
    def edit
    end
  
    def update
      if @idea.update idea_params
        redirect_to product_path(@idea)
      else
        render :edit
      end
    end
  
    def destroy
     @idea.destroy
     redirect_to ideas_path
    end
  
    private
  
    def idea_params
      # strong parameters are used primarily as a security practice to help
      # prevent accidentally allowing users to update sensitive model attributes.
      params.require(:idea).permit(:title, :description)
    end
  
    def find_product
      @idea = Idea.find params[:id]
    end
  
end
