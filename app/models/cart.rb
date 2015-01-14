class Cart
  attr_reader :items

  def self.build_from_hash hash 
    items = hash['items']['cart'].map do |item_data|
      CartItem.new item_data['product_id'], item_data['quantity']
    end
    new items
  end

  def initialize items = []
    @items = items
  end

  def add_item product_id
    item = @items.find { |item| item.product_id == product_id }
    if item
      item.increment
    else
      @items << CartItem(product_id)
    end
  end

  def empty?
    @items.empty?
  end

  def serialize
    items = @items.map do |item| 
      { 
        "product_id" => product.id, 
        "quantity" => item.quantity
      }
    end

    {
      "cart" => {
        "items" => items
      }
    }
  end
end
