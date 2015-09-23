class PaymentsController < ApplicationController
  def create
    product = Product.find(params[:product_id])
    token = params[:stripeToken]
    #create the charge on Stripe's servers - this will charge the card
    begin
      charge = Stripe::Charge.create(
        :amount => product.price,
        :currency => "gbp",
        :source => token,
        :description => params[:stripeEmail]
      )
    rescue Stripe::CardError => e
      #the card has been declined
      body = e.json_body
      err = body[:error]
      flash[:error] = "Unfortunately, there was an error processing your payment: #{err[:message]}"
    end
    
    respond_to do |format|
    if @payment.save
      format.html { redirect_to @product, notice: 'Thank you for your payment. Your order will be processed.' }
      format.js   {}
      format.json { render json: @product, status: :created, location: @product }
    else
      format.html { render action: "new" }
      format.json { render json: @product.errors, status: :unprocessable_entity }
    end
  end
    redirect_to product_path(product)
  end
end


