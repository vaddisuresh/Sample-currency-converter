require 'money'
class ProductsController < ApplicationController
  
  def index
    @products = Product.all
  end
  
  def change_curreny
    file_data = Product.get_currency_data_arry
    products = Product.all
    if params["type"] != "EUR"
      @products = []
      selected_currency_price = Product.get_selected_currency_price(params["type"], file_data)
      products.each do |product|
        product.price = float_to_round_num_of_decimals(product.price.to_f * selected_currency_price.to_f)
        @products << product
      end
    else
     @products = products
    end
  end

  def float_to_round_num_of_decimals(float, num_of_decimal_places=2)
    float = 0.0 if float.to_f.nan?
    float = float.to_f
    exponent = num_of_decimal_places
    float = float*(10**exponent)
    float = float.round
    float = float / (10.0**exponent)
    float
  end
end
