require_relative "app/store_application"

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

order = Order.new
order.place
puts order.placed_at.utc
puts order.placed_at.strftime("%b %-d, %Y %H:%M:%S") # Jan 1, 1970 15;00;00
puts order.time_spent_on_sending_email