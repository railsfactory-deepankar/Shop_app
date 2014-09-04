# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Product.delete_all
# . . .
Product.create!(title: 'Programming Ruby 1.9 & 2.0',
description:
%{<p>
Ruby is the fastest growing and most exciting dynamic language
out there. If you need to get working programs delivered fast,
you should add Ruby to your toolbox.
</p>},
image_url: 'index.jpeg',
price: 49.95)
# . . .
Product.create!(title: 'Agile web development with rails',
description:
%{<p>
This book will give you complete description about
how to develop an application in agile methodology
with Rails.
</p>},
image_url: 'agile_web_development.jpeg',
price: 67.95)
#. . .
Product.create!(title: 'Getting Started with Ubuntu',
description:
%{<p>
This book will give you complete description about
how to work with Ubuntu from the scratch.
</p>},
image_url: 'ubuntu.jpeg',
price: 79.36)
#.  .  .

