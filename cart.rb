class Cart

  attr_reader :items
  attr_writer :items

  include ItemContainer
  
  def initialize
    @items = Array.new
  end

end