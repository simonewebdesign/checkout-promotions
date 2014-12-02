class Checkout
  include PromotionalRules

  def initialize
    @basket = Basket.new
    @total = 0
  end

  def scan(item)
    @basket.add item
  end

  def total
    apply_discount_for_travel_cards

    @basket.items.each {|item| @total += item.price }

    ten_percent_discount_for_purchases_over 60

    @total.round(2)
  end
end
