ActiveAdmin.register_page "Dashboard" do

  menu priority: 1, label: proc{ I18n.t("active_admin.dashboard") }

  content title: proc{ I18n.t("active_admin.dashboard") } do
    section "Recent Orders" do
    table_for Order.order("created_at desc").limit(5) do
        column :name
        
        column :status do |order|
          div  :class => "status" do
          status_tag(order.status)
          end
        end
        column :id do |id|
      link_to id.id, admin_order_path(id),  :onclick=>"window.open(this.href,'view order info','scrollbars=yes,height=600, width=600');return false;"
        end
            end
end

#  section "This Month Orders" do
#     table_for LineItem.order("created_at desc").limit(10) do
#         column :product
#         column :order
         
#     end
# end
    section "Products Available" do
    table_for Product.order("created_at desc") do
        column :title do |product|
        link_to product.title, admin_product_path(product),  :onclick=>"window.open(this.href,'view product description','scrollbars=yes,height=600, width=600');return false;" 
 
      end
      column :created_at
      column :price, :sortable => :price do|product|
       
          number_to_currency product.price
       
      end
      
    end
end


section "Users Registered" do
table_for User.order("created_at desc") do
    column :name
    column :created_at
    end
end

   end
end
