require_relative "string"
require_relative "item_container"
require_relative "cart"
require_relative "order"
require_relative "Item"
require_relative "virtual_item"
require_relative "real_item"

@items = []
@items << VirtualItem.new({:price => 145, :weight => 35, :name => "car"})
@items << RealItem.new({:price => 120, :weight => 75, :name => "kettle"})
@items << RealItem.new({:price => 167, :weight => 20, :name => "dishwasher"})
