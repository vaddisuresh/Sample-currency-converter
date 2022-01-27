Product.create(:name => "Soap", :description => "Life boy", :price => 30.0)
Product.create(:name => "Tooth Brush", :description => "Colgate", :price => 20.0)
Product.create(:name => "Tooth paste", :description => "Colgate", :price => 40.0)
Product.create(:name => "chair", :description => "strong chair, best in market", :price => 30.0)
Product.create(:name => "Pens", :description => "Best in quality", :price => 20.0)
Product.create(:name => "pencil", :description => "nice quality", :price => 40.0)
user = User.new
user.email = "test@g.com"
user.encrypted_password = "$2a$11$zW3yakd8lwb1.6Y0r0kJDO0ACAn14ZtKcfsq4fwIkogxrcWHAmbpC" #password: 123456
user.save(validate: false)