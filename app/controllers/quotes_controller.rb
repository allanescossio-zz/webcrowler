class QuotesController < ApplicationController  

  # GET /quotes/{SEARCH_TAG}
  def show_by_tag
    render json: QuoteService.new.find_by_tag(params[:tag])      
  end
end
