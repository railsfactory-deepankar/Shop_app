class Order < ActiveRecord::Base
 has_many :line_items, dependent: :destroy
 has_many :products, through: :line_items
 belongs_to :user

 PAYMENT_TYPES = [ "Check", "Credit card", "Purchase order" ]
 validates :name, :address, :email, presence: true
 validates :pay_type, inclusion: PAYMENT_TYPES

 after_create :add_status

  def add_status
    self.update_attributes(status: "pending")
  end
# def totalprice(current_user)
    	  
#     	   @totalprice = 0
#     	    line_items = LineItem.all 

#     	  current_user.line_items.where(:order_id => nil).each do |m|
#     	 @totalprice += m.product.price * m.quantity

    	
#            end

#            @totalprice
#      end

end
