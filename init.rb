require_relative "store_application"

StoreApplication.config do |app|

  app.name = "My Store"
  app.environment = :development

  app.admin do |admin|
    admin.email = "sergiyzhbanov@gmail.com"
    admin.login = "admin"
    admin.send_info_emails_on :mondays
  end
end

unless StoreApplication.frozen?
  StoreApplication.name = "My name"
end
# StoreApplication::Admin.email = "new@email.com"
p StoreApplication::Admin.email

@items = []
@items<<(AntiqueItem.new "car", price: 145, weight: 35)
@items << RealItem.new({:price => 120, :weight => 75, :name => "kettle"})
@items << RealItem.new({:price => 167, :weight => 20, :name => "dishwasher"})

cart = Cart.new("sdwdaw")
cart.add_item RealItem.new({:price => 160, :weight => 75, :name => "car"})
cart.add_item RealItem.new({:price => 120, :weight => 75, :name => "kettle"})
cart.add_item RealItem.new({:price => 190, :weight => 75, :name => "car"})
