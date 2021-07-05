require "rspec"
require_relative "../app/Item"
require_relative "../app/virtual_item"

describe Item do

  # create new object before each test
  before(:each) do
    @item = Item.new("kettle", price: 200)
  end

  # use the same object before all tests
  before(:all) do
    # @item = Item.new("kettle", price: 200)
  end

  after(:each) {}
  after(:all) {}
  
  it "calculates price according to special formula" do
    # should is deprecated
    # item.price.should == 222
    expect(@item.price).to   eq(222)
    @item.price = 300
  end

  it "returns info about an object" do
    expect(@item.to_s).to   eq("kettle:222.0")
  end

  it "calculates spec" do
    @item.send(:tax).should_not be_nil
  end
end