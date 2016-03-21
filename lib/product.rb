class Product
  attr_reader :title, :price
  attr_accessor :stock

  @@products = []

  def initialize(options = {})
    @title = options[:title]
    @price = options[:price]
    @stock = options[:stock]
    add_to_products
  end

  def self.all
    @@products
  end

  def self.find_by_title(title)
    all.find { |toy| toy.title == title }
  end

  private

  def add_to_products
    @@products.each do |toy|
        raise DuplicateProductError, "'#{self.title}' already exists." if toy.title == title
      end

    @@products << self
  end
end
