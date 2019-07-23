class ReviewsController < ApplicationController

    before_action :authenticate_user!


    def create
        @idea = Idea.find params[:idea_id]
        @review   = Review.new review_params
        @review.idea = @idea
        @review.user_id = current_user
        if @review.save
            redirect_to idea_path(@idea), notice: 'Answer created!'
        else
            @reviews = @idea.reviews.order(created_at: :desc)
            render '/ideas/show'
        end
    end

    def destroy
        @review = Review.find params[:id]
       
        if can?(:crud, @review)
            @review.destroy     
            redirect_to idea_path(@review.idea), notice: 'Review Deleted'
        else 
            head :unauthorized    
        end
    end

    private 



    def review_params
        params.require(:review).permit(:body)
    end
end
