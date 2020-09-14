class AuthorsController < ApplicationController
  def index
  	@authors = Author.all
  end

  def new
	@author = Author.new
  end

  def create
		@author = Author.new(params_book)
		byebug
		if @author.save
			redirect_to root_path
			flash[:success] = "you have succesfully created a new book"
		else
			flash[:error] = "invalid entry"
			
		end
	end

	def edit
		@author = Author.find(params[:id])
	end

	def update
		@author = Author.find_by(params[:id])
		if @author.update(params_author)
			flash[:success] = "successfully updated"
			redirect_to authors_path
		else
			flash[:alert] = "something went wrong"
			redirect_to edit_author_path
		end
	end
	
	def destroy
		@author = Author.find(params[:id])
		if @author.destroy
			flash[:success] = "you have succesfully deleted this book"
			redirect_to authors_path
		end
	end
	
	private
	def params_author
		params.require(:author).permit(:firstname, :lastname, :dateofbirth)
	end
end
