class Transaction

  attr_reader :customer, :product, :id, :purchase_time

  @@transactions = []

  def initialize (customer,product)
    return puts "OutOfStockError: '#{product.title}' is out of stock." unless product.in_stock?
    @customer = customer
    @product = product
    @id = @@transactions.length + 1
    @purchase_time = Time.now
    @product.stock -= 1
    add_to_transactions
  end

  def self.all
    @@transactions
  end

  def self.find(id)
    all.find { |transaction| transaction.id == id }
  end

private

  def add_to_transactions
    @@transactions << self
  end
end
