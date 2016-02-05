class OntapController < ApplicationController
  helper_method :sort_column, :sort_direction  
  
  def index
    @beers = Beer.order(sort_column + " " + sort_direction)
    #@beers = Beer.order(params[:sort])
  end
  
  private
  
  def sort_column
    Beer.column_names.include?(params[:sort]) ? params[:sort] : "name"
  end
  
  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end
end
