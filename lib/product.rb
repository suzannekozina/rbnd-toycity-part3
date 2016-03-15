class Product
  attr_reader :title

  @@products = []

  def initialize(options={})
    @title = options[:title]
    add_to_products
  end

  def self.all
    @@products
  end

  private

  def add_to_products
    # @@products.each {|product| raise DuplicateProductError, "'#{@title}' already exists." if (product.title == @title && @@products.size != 0)}
    @@products.each {|product| raise DuplicateProductError, "'#{@title}' already exists." if (product.title == @title)}
    @@products << self
  end
end
