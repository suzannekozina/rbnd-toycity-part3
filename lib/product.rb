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

  def self.in_stock
    all.select(&:in_stock?)
  end

  def in_stock?
    stock > 0
  end

  private

  def add_to_products
    @@products.each do |toy|
        raise DuplicateProductError, "'#{self.title}' already exists." if toy.title == title
      end

    @@products << self
  end
end
