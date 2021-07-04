require_relative "string"
require_relative "item_container"
require_relative "Item"
require_relative "virtual_item"
require_relative "real_item"
require_relative "antique_item"
require_relative "cart"
require_relative "order"


@items = []
@items << AntiqueItem.new({:price => 145, :weight => 35, :name => "car"})
@items << RealItem.new({:price => 120, :weight => 75, :name => "kettle"})
@items << RealItem.new({:price => 167, :weight => 20, :name => "dishwasher"})

cart = Cart.new("sdwdaw")
cart.add_item RealItem.new({:price => 160, :weight => 75, :name => "car"})
cart.add_item RealItem.new({:price => 120, :weight => 75, :name => "kettle"})
cart.add_item RealItem.new({:price => 190, :weight => 75, :name => "car"})

puts cart.kind_of?(Cart)
puts @items[0].kind_of?(Item)
puts @items[0].kind_of?(AntiqueItem)
puts @items[0].class == AntiqueItem
puts @items[0].class == Item
puts @items[0].respond_to?(:info)
puts @items[0].respond_to?(:important_info)

method = "all_cars"
p cart.send(method)
puts @items[0].send(:tax)
puts @items[0].tax