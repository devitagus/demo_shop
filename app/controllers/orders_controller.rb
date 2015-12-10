class OrdersController < ApplicationController
  def show
    @order = Order.where(state: 'paid').find(params[:id])
  end

  def create
    @book = Book.find(params[:book_id])
    @order = Order.create!(book_isbn: @book.isbn, amount: @book.price, state: 'pending')
    redirect_to new_order_payment_path(@order)
  end
end
