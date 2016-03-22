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
        return puts "DuplicateCustomerError: '#{self.name}' already exists." unless customer.name != name
    end
    @@customers << self
  end
end
