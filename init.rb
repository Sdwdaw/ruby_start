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

p StoreApplication.environment
p StoreApplication.name
p StoreApplication::Admin.email
p StoreApplication::Admin.login

@items = []
@items<<(AntiqueItem.new "car", price: 145, weight: 35)
@items << RealItem.new({:price => 120, :weight => 75, :name => "kettle"})
@items << RealItem.new({:price => 167, :weight => 20, :name => "dishwasher"})

@items.each { |i| puts i.name }

cart = Cart.new("sdwdaw")
cart.add_item RealItem.new({:price => 160, :weight => 75, :name => "car"})
cart.add_item RealItem.new({:price => 120, :weight => 75, :name => "kettle"})
cart.add_item RealItem.new({:price => 190, :weight => 75, :name => "car"})

method = "all_cars"
p cart.send(method)

order = Order.new
@items.each { |i| order.add_item(i) }
order.place