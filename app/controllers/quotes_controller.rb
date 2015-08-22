class QuotesController < ApplicationController
	def index
	 @quote = Quote.order("RANDOM()").first
	end

  	def create
  	   @quote = Quote.create(quote_params)
  	   if @quote.invalid?
  	   		flash[:error] = '<strong>Could not save</strong> because the data you entered is invalid.'
  	   	  flash[:hint] = 'Hint: Quotes are limited to 250 characters, and you can count your characters here <a target="_blank" class="links" href="http://www.charactercountonline.com">Character Counter</a>.'
        end
  	   redirect_to root_path
  	end

    def about
    end

    def show
          @quote = Quote.where(:id => params[:id]).first
          if @quote.blank?
            render :text => "Not Found", :status => :not_found
          end
    end


  	private

  	def quote_params
  		params.require(:quote).permit(:saying, :author)
  	end	
end
