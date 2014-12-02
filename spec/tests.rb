require './promotional_rules'
require './checkout'
require './basket'
require './product'

describe Checkout do

  let(:basket) { 
    Basket.new.add(
      Product.new(
        code: '001',
        name: 'Travel Card Holder',
        price: 9.25
      )
    ).add(
      Product.new(
        code: '002',
        name: 'Personalised cufflinks',
        price: 45
      )    
    ).add(
      Product.new(
        code: '003',
        name: 'Kids T-shirt',
        price: 19.95
      )
    )
  }

  let (:co) { Checkout.new }

  it "works with sequential items" do
    basket.items.each {|item| co.scan(item) }
    expect(co.total).to eq 66.78
  end

  it "can scan items in any order" do
    co.scan basket.find_product_by_code('001')
    co.scan basket.find_product_by_code('003')
    co.scan basket.find_product_by_code('001')
    expect(co.total).to eq 36.95
  end
  
  it "calculates the correct total" do
    co.scan basket.find_product_by_code('001')
    co.scan basket.find_product_by_code('002')
    co.scan basket.find_product_by_code('001')
    co.scan basket.find_product_by_code('003')
    expect(co.total).to eq 73.76
  end
end
