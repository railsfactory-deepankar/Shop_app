ActiveAdmin.register_page "Dashboard" do

  menu priority: 1, label: proc{ I18n.t("active_admin.dashboard") }

  content title: proc{ I18n.t("active_admin.dashboard") } do
    section "Products Available" do
    table_for Product.order("created_at desc") do
      column :title
      column :created_at
    end
end


section "Users Registered" do
table_for User.order("created_at desc") do
    column :name
    column :created_at
    end
end

section "Recent Orders" do
    table_for Order.order("created_at desc").limit(5) do
        column :name
        column :address
        column :pay_type
        column :status
    end
end
  section "This Month Orders" do
     table_for LineItem.order("created_at desc").limit(10) do
         column :product
         column :order
         
     end
 end
   end
end
