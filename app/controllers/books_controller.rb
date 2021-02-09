class BooksController < ApplicationController
  def index
    @q = Book.ransack(params[:q])
    @books =@q.result(distinct: true)
    #@books = Book.order(:title).page params[:page_method_name]
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      redirect_to root_path, notice: 'Se ha creado el libro'
    else
      redirect_to render :new, alert: 'No se pudo crear el libro'
    end

  end

  private

  def book_params
    params.require(:book).permit(:title, :author, :status, :borrowed_at, :return_at)
  end


end
