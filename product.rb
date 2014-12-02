class Product

  attr_reader :code, :name
  attr_accessor :price

  def initialize(params)
    @code, @name, @price = params[:code], params[:name], params[:price]
  end
end
