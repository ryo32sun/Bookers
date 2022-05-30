class BooksController < ApplicationController
  def index
    @books = Book.all
    @book = Book.new
  end
  
  def create
    @book = Book.new(book_params)
    @book.save
    if @book.save
      flash[:notice] = "Book was successfully creared."
      redirect_to book_path(@book.id)
    else
      @books = Book.all
      render :index
    end
  end
  
  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end
  
  def update
    @book = Book.find(params[:id])
    @book.update(book_params)
    if @book.update(book_params)
      flash[:notice] = "Book was successfully update"
      redirect_to book_path
    else
      render :edit
    end
  end
  
  def destroy
    book = Book.find(params[:id])
    book.destroy
    if book.destroy
      flash[:notice] = "Book was successfuly destroyed"
    redirect_to books_path
    end
  end
  
  private
  def book_params
    params.require(:book).permit(:title, :body)
  end
  
end
