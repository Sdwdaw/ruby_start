require "rspec"
require_relative "../app/Item"
require_relative "../app/virtual_item"

describe Item do
  
  it "calculates price according to special formula" do
    item = Item.new("kettle", price: 200)
    # should is deprecated
    # item.price.should == 222
    expect(item.price).to   eq(222)
  end

end