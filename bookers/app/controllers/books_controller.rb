class BooksController < ApplicationController
  def index
    @books = Book.all
    @book = Book.new
  end

  def create
    book = Book.new(book_params)
    if book.save
      redirect_to book_path(book) #投稿詳細ページ(show)へ移動
      flash[:notice] = "Book was successfully created."
    else
      render books_path #投稿一覧ページ(index)へ
      #flashではない何かerror文が表示されている
    end
  end

  def show
    @book = Book.find_by(params[:title], params[:body])
  end

  def edit
    @book = Book.find_by(params[:id])
    #validation、なければerror
    #flash[:notice] = "Book was successfully update"　#successfully必要
  end

  def update
  end

  def destroy
    #@book = Book.find_by(id: params[:id])　#successfully必要

  end

private
  def book_params
    params.require(:book).permit(:title, :body)
  end


end
