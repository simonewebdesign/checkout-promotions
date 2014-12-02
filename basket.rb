class Basket

  attr_reader :items

  def initialize(items = [])
    @items = items
  end

  def add(item)
    @items << item
    return self
  end

  def find_product_by_code(code)
    idx = @items.index {|e| e.code == code }
    @items[idx]
  end

  def find_products_by_name(name)
    @items.select {|e| e.name == name }
  end
end
