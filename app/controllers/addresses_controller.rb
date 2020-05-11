class AddressesController < ApplicationController
   def new
      @address = Address.new
    end
  
    def create
      Address.create(address_params)
    end
  
    private
    
      def address_params
        params.require(:address).permit(:postcode, :prefecture_name, :address_city, :address_street, :address_building)
      end
end
