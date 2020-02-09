class Api::V1::IdeasController < ApplicationController
    def index
        @ideas = Idea.order("created_at DESC")
        render json: @ideas
end
def create
    @idea =Idea.create(idea_params)
    render json: @idea
end

def update
    @idea = Idea.find(params[:id])
    @idea.update_attributes(idea_params)
    render json: @idea
end
def destroy
    @idea = Idea.find(params[:id])
    @idea.destroy
    head :no_content
end
def show
      @idea = Idea.find(params[:id])
     render json: @idea
end
private
def idea_params
    params.require(:idea).permit(:title, :body)
end

end