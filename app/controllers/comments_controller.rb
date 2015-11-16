class CommentsController < ApplicationController
  http_basic_authenticate_with name: "Mr_S", password: "homebrew", only: :destroy
  
  def create
    @beer = Beer.find(params[:beer_id])
    @comment = @beer.comments.create(comment_params)
    redirect_to beer_path(@beer)
  end
  
  def destroy
    @beer = Beer.find(params[:beer_id])
    @comment = @beer.comments.find(params[:id])
    @comment.destroy
    redirect_to beer_path(@beer)
  end
  
  private
    def comment_params
      params.require(:comment).permit(:commenter, :body)
    end
end
