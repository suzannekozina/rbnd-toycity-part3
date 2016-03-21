class Customer

  attr_reader :name

  @@customers = []

  def initialize(name)
    @name = name
    add_to_customers
  end

  def self.all
    @@customers
  end

  private

  def add_to_customers
    @@customers.each do |customer|
      if customer.name == @name
        raise DuplicateCustomerError, "'#{self.name}' already exists."
      end
    end
    @@customers << self
  end
end
