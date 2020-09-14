class BooksController < ApplicationController
    def index
   	 @books = Book.all
    end

	def new
		@book = Book.new
	end

	def create
		@book = Book.new(params_book)
		byebug
		if @book.save
			redirect_to root_path
			flash[:success] = "you have succesfully created a new book"
		else
			flash[:error] = "invalid entry"
			
		end
	end

	def edit
		@book = Book.find(params[:id])
	end

	def update
		@book = Book.update(params_book)
		if @book.save
			redirect_to books_path
		else
			flash[:alert] = "something went wrong"
			redirect_to edit_book_path
		end
	end
	
	def destroy
		@book = Book.find(params[:id])
		if @book.destroy
			flash[:success] = "you have succesfully deleted this book"
			redirect_to root_path
		end
	end
	
	private
	def params_book
		params.require(:book).permit(:title, author_ids: [])
	end
end
