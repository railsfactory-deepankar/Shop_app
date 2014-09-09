ActiveAdmin.register Product do
  
config.batch_actions = false
  config.filters = false 
permit_params :list, :of, :attributes, :on, :model, :title, :description, :image, :price

 index do
    selectable_column
    id_column
    column :title
    column :description
    column :image do |img|
          div  :class => "img" do
          image_tag(img.image)
          end
        end
    column :price
    actions
  end
  form :html => { :enctype => "multipart/form-data" } do |f| 
    f.inputs "Product", :multipart => true do 
      f.input :title 
      f.input :description 
      f.input :image
      f.input :price 
   end 
    f.actions
  end

    show do |ad|
      attributes_table do
        row :title
        row :description do |des|
          sanitize(des.description)
        end
         row :price do |product|
         div  :class => "price" do
          number_to_currency(product.price)
          end
        end
      end   
    end
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  #
  # or
  #
  # permit_params do
  #   permitted = [:permitted, :attributes]
  #   permitted << :other if resource.something?
  #   permitted
  # end


end
