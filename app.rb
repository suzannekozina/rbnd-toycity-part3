require_relative "lib/errors"
require_relative "lib/customer"
require_relative "lib/product"
require_relative "lib/transaction"

# PRODUCTS

Product.new(title: "LEGO Iron Man vs. Ultron", price: 22.99, stock: 55)
Product.new(title: "Nano Block Empire State Building", price: 49.99, stock: 12)
Product.new(title: "LEGO Firehouse Headquarter", price: 199.99, stock: 0)

puts Product.all.count # Should return 3

Product.new(title: "LEGO Iron Man vs. Ultron", price: 22.99, stock: 55)
# Should return DuplicateProductError: 'LEGO Iron Man vs. Ultron' already exists.

nanoblock = Product.find_by_title("Nano Block Empire State Building")
firehouse = Product.find_by_title("LEGO Firehouse Headquarter")

puts nanoblock.title # Should return 'Nano Block Empire State Building'
puts nanoblock.price # Should return 49.99
puts nanoblock.stock # Should return 12
puts nanoblock.in_stock? # Should return true
puts firehouse.in_stock? # Should return false

products_in_stock = Product.in_stock
# Should return an array of all products with a stock greater than zero
puts products_in_stock.include?(nanoblock) # Should return true
puts products_in_stock.include?(firehouse) # Should return false

# CUSTOMERS

Customer.new(name: "Walter Latimer")
Customer.new(name: "Julia Van Cleve")

puts Customer.all.count # Should return 2

Customer.new(name: "Walter Latimer")
# Should return DuplicateCustomerError: 'Walter Latimer' already exists.

walter = Customer.find_by_name("Walter Latimer")

puts walter.name # Should return "Walter Latimer"

# TRANSACTIONS

transaction = Transaction.new(walter, nanoblock)

puts transaction.id # Should return 1
puts transaction.product == nanoblock # Should return true
puts transaction.product == firehouse # Should return false
puts transaction.customer == walter # Should return true

puts nanoblock.stock # Should return 11

# PURCHASES

puts walter.purchase(nanoblock)

puts Transaction.all.count # Should return 2

transaction2 = Transaction.find(2)
puts transaction2.product == nanoblock # Should return true

walter.purchase(firehouse)
# Should return OutOfStockError: 'LEGO Firehouse Headquarter' is out of stock.

# NEW FEATURES
puts
puts "~~~~~~~~~~~~~~~~~~~~~~~New Features~~~~~~~~~~~~~~~~~~~~~~~~"
puts "Feature 1: Raises InvalidInputError if entering new Product data incorrectly"
# Product.new(title: "Super Fun Toy", price: "low, low price", stock: 55)
# Should return Price must be numeric, 'low' is invalid input (InvalidInputError).

# Product.new(title: "Super Fun Toy", price: 9.99, stock: "empty")
# Should return Price must be numeric, 'low' is invalid input (InvalidInputError).
puts
puts "Feature 2: Time of transaction"
Product.new(title: "Super Fun Toy", price: 9.99, stock: 3)
super_fun = Product.find_by_title("Super Fun Toy")
Customer.new(name: "Suzanne Kozina")
suzanne = Customer.find_by_name("Suzanne Kozina")
transaction3 = Transaction.new(suzanne, super_fun)
puts "Transaction3: #{transaction3.purchase_time}"
puts
puts "Feature 3: Count Transactions associated with a given product"
transaction4 = Transaction.new(walter, super_fun)
julia = Customer.find_by_name("Julia Van Cleve")
transaction5 = Transaction.new(julia, super_fun)
puts Transaction.transactions_for_product(super_fun).count
#Should return 3
