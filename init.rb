require_relative "store_application"

puts StoreApplication.new == StoreApplication.new
p StoreApplication.new

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