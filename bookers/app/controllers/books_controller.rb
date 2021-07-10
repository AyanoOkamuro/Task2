class BooksController < ApplicationController
  def index
    @books = Book.all
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    @books =  Book.all
    if @book.save
      flash[:success] = "Book was successfully created."
      redirect_to book_path(@book) #投稿詳細ページ(show)へ移動
    else
      render :index #投稿一覧ページ(index)へ
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
    if @book.update(book_params)
      flash[:success] = "Book was successfully updated."
      redirect_to book_path(@book)
    else
      render :edit #投稿編集ページ(edit)へ
    end
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    flash[:success] = "Book was successfully destroyed."
    redirect_to books_path
  end

private
  def book_params
    params.require(:book).permit(:title, :body)
  end


end
