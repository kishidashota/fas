class ShopsController < ApplicationController
  def new
    @shop = Shop.new
  end

  
  def create
    Shop.create(shop_params)
    redirect_to new_address_path
  end

  private
  def shop_params
    params.require(:shop).permit(:shop_name, :shop_description,:shop_image)
  end

end
