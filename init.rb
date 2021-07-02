require_relative "item_container"
require_relative "cart"
require_relative "order"
require_relative "Item"
require_relative "virtual_item"
require_relative "real_item"

# cart = Cart.new

# cart.add_item(Item.new)
# cart.add_item(Item.new)
# p cart.items

# cart.remove_item
# cart.validate

# p cart.items

item = Item.new({:price => 10, :weight => 35, :name => "Car"})
item.info { |attr| puts attr }

item1 = VirtualItem.new({:price => 145, :weight => 35, :name => "Car"})
item2 = RealItem.new({:weight => 75, :name => "InvalidProduct"})
item3 = RealItem.new({:price => 167, :weight => 20, :name => "Dishwasher"})
cart = Cart.new
cart.add_item item1
cart.add_item item3
cart.remove_item

p cart.items
# cart.delete_invalid_items
p cart.items

p item1.respond_to?(:weight)
p item2.respond_to?(:weight)

puts Item.discount

puts item1.price

puts item1.real_price

puts cart.items.size

order = Order.new
order.add_item item1
order.add_item item3
order.add_item item3
order.remove_item
puts order.items.size

puts order.count_valid_items

puts cart.items.size