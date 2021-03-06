class Item
  # def initialize
  #   @price = 30
  # end
  # def price
  #   @price
  # end  
  # def price=(price_value)
  #   @price = price_value
  # end
  # attr_reader :price, :weight
  # attr_writer :price, :weight

  @@discount = 0.1

  def self.discount
    if Time.now.month == 4
      return @@discount + 0.2
    else
      return @@discount
    end
  end

  def self.show_info_about(attr, block)
    @@show_info_about ||= {}
    @@show_info_about[attr] = block
  end

  def initialize(name, options = {})
    @real_price = options[:price]
    
    @name = name
  end

  attr_reader :real_price, :name

  def price=(value)
    @real_price = value
  end

  def info
    # [price, weight, name]
    # price.to_s + ", " + weight.to_s + ", " + name.to_s
    yield(price)
    # yield(weight)
    yield(name)
  end

  def price
    if @real_price
      (@real_price - @real_price * self.class.discount) + tax
    end
  end

  def to_s
    "#{self.name}:#{self.price}"
  end

  private
  def tax
    type_tax = if self.class == VirtualItem
      1
    else
      2
    end
    cost_tax = if @real_price > 5
      @real_price*0.2
    else
      @real_price*0.1
    end
    cost_tax + type_tax
  end
end

Item1 = Item.new({ :price => 35, :weight => 47 })
Item2 = Item.new({ :price => 78, :weight => 105 })
# puts "Item1 price = " + Item1.price.to_s
# Item1.price=(rand(100))
# Item2.price = rand(100)
# Item1.weight = 95
# puts Item1.price
# puts Item2.price
# puts Item1.weight