# We can write new rules/methods here 
# and then add them to Checkout#total
module PromotionalRules

  # If you buy 2 or more travel card holders
  # then the price drops to 8.50.
  def apply_discount_for_travel_cards
    products = @basket.find_products_by_name('Travel Card Holder')
    if !products.empty? && products.size >= 2
      products.each {|p| p.price = 8.5 }
    end
  end

  # If you spend over 60, 
  # then you get 10% off your purchase
  def ten_percent_discount_for_purchases_over(total)
    if (@total > total)
      discount = @total * 0.1
      @total = @total - discount
    end
  end
  
end
