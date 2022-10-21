class BooksController < ApplicationController
  def new
  end

  def create
    @book = Book.new(list_params)
    pp current_user
    @book.user_id = current_user.id
    if @book.save
      flash[:success] = "You have created book successfully."
      redirect_to '/books'
    else
      @bookDataAdd = Book.new
      @bookAll = Book.all
      render :index
    end

  end

  def index
    pp current_user.id
    @bookDataAdd = Book.new
    @bookAll = Book.all
  end

  def show
    @bookDataAdd = Book.new
    @book = Book.find(params[:id])
  end

  def edit
    book = Book.find(params[:id])
    if current_user.id == book.user_id
      @book = book
    else
      redirect_to book_path(params[:id])
    end
  end
  def update
    @book = Book.find(params[:id])
    if @book.update(list_params)
      flash[:success] = "You have updated book successfully."
      redirect_to book_path(@book.id)
    else
      @bookDataAdd = Book.new
      @bookAll = Book.all
      render :index
    end

  end
  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to user_path(current_user.id)
  end
  def list_params
    params.require(:book).permit(:title, :body)
  end
end
