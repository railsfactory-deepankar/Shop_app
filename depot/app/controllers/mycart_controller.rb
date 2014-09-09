class MycartController < ApplicationController
	before_action :authenticate_user!
	def index
		@added_to_cart=current_user.line_items.where(order_id: nil)
		respond_to do |format|

		  if @added_to_cart.empty?
              format.html { redirect_to store_url, notice: 'your current cart is empty.' }
             
          else
               format.html { render :index}
               format.json { head :no_content }
          end
        end

	end
	
	def delete
	       
    @line_item = LineItem.find(params[:item_id])
    if @line_item.quantity > 1
      @line_item.update_attributes(:quantity => @line_item.quantity - 1)
    else
      @line_item.destroy
    end

    respond_to do |format|
      format.html { redirect_to(mycart_index_path) }
      format.xml  { head :ok }
    end
  end
	     
end
