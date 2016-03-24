class Customer

  attr_reader :name

  @@customers = []

  def initialize(options = {})
    @name = options[:name]
    add_to_customers
  end

  def self.all
    @@customers
  end

  def self.find_by_name(name)
    all.find { |customer| customer.name == name}
  end

  def purchase(product)
  Transaction.new(self, product)
  end

  private

  def add_to_customers
    @@customers.each do |customer|
      raise DuplicateCustomerError, "'#{self.name}' already exists." if customer.name == name
    end
    @@customers << self
  end
end
