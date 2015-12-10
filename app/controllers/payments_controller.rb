class PaymentsController < ApplicationController
  before_action :set_order

  def new
  end

  def create
    # send it to STRIPE to charge the customer
    @amount = @order.amount_cents

    # user -> stripe customer
    customer = Stripe::Customer.create(
      source: params[:stripeToken],
      email: params[:stripeEmail]
    )

    # charge
    charge = Stripe::Charge.create(
      customer: customer.id,
      amount: @amount,
      description: "payment for a book",
      currency: 'eur'
    )

    @order.update(state: 'paid', payment: charge.to_json)
    redirect_to order_path(@order)
  end

  private

  def set_order
    @order = Order.where(state: 'pending').find(params[:order_id])
  end
end
