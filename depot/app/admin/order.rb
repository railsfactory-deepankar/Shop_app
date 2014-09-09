ActiveAdmin.register Order do

 # config.filters = false
  actions :all, :except => [:new, :destroy]
  config.per_page = 10
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  #permit_params :list, :of, :attributes, :on, :model, :name, :address, :email, :pay_type
  permit_params :list, :of, :attributes, :on, :model, :status
   filter :name
   filter :pay_type

   #controller do
   # def show
   #   render "show"
   # end
   #end

  #show do |ad|
     # attributes_table do
      #  row :name
        # row :order.products.each  do |des|
        #   des.product.title
        # end
         #row :price do |product|
         #div  :class => "price" do
         # number_to_currency(product.price)
          #end
        
      #end   
      #attributes_table_for order.products do
      #    row :title
       #   row :price
          # attributes_table_for line_items do 
             # row :quantity
         #   end
        #end
    #end
  #
  # or
  #
  # permit_params do
  #   permitted = [:permitted, :attributes]
  #   permitted << :other if resource.something?
  #   permitted
  # end
  show do |order|
    div do
      attributes_table do
        row :name
        row :address
        row :pay_type
        row :status
      end
    end

    div do      
      panel("Products") do
        table_for(order.line_items) do
          column "Title" do |i| 
            i.product.title
          end
          column :quantity
            @arr = []
            @total = 0
          column "Price" do |i| 
            @arr << i.total_price
            number_to_currency(i.total_price)
          end
           @total = @arr.sum
          
             table_for(order) do
              column "Total price" do 
                  @total                
              end
            end
          
        end
      end
    end
  end
  end