class BooksController < ApplicationController
  def index
    @books = Book.all
    @book = Book.new
  end
  
  def create
    book = Book.new(book_params)
    if book.save
      redirect_to book_path #投稿詳細ページ(show)へ移動
      flash[:notice] = "Book was successfully created."
    else
      render books_path #投稿一覧ページ(index)へ
      #flashではない何かerror文が表示されている
    end
  end

  def show
  end

  def edit
    @book = Book.find_by(id: params[:id]) #curent_bookがいる？
    #validation、なければerror
    flash = "Book was successfully update"　#successfully必要
  end
  
  def destroy
    @book = Book.find_by(id: params[:id])　#successfully必要
    
  end

private
  def book_params
    params.require(:book).permit(:title, :body)
  end


end
