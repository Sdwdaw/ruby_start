require "rspec"
require_relative "../app/Item"
require_relative "../app/virtual_item"
require_relative "../app/antique_item"
require_relative "../app/item_container"
require_relative "../app/cart"

describe Cart do
  
  describe "managing items" do
    
    it "adds items into thr cart" do
      cart = Cart.new("sdwdaw")
      item1 = Item.new("kettle", price: 200)
      item2 = Item.new("car", price: 200)
      cart.add_items(item1, item2)
      cart.items.should include(item1, item2)
    end
  
    it "removes items from itself" do
      pending("something else getting finished")
      this_should_not_get_executed
    end

  end
  
  it "counts items in itself"
  it "places order using all the items that were added into the cart"
  it "clears itself off thr items aftr an order is placed"
end