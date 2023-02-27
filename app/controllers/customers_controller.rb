class CustomersController < ApplicationController
  def index; end

  def new
    @customer = Customer.new
  end

  def create
    @customer = Customer.new(customer_params)

    if @customer.save
      # redirect_to customer_path(@customer)
      redirect_to customers_path, notice: 'Customer was successfully created'
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def customer_params
    params.require(:customer).permit(:name, :email, :phone, :avatar, :smoke)
  end
end
