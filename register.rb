require 'csv'
require 'virtus'

require './product.rb'
require './line_item.rb'
require './transaction.rb'



csv_pathname = "./input1.csv"

transaction = Transaction.new
transaction.parse_line_items_from_csv(csv_pathname)

puts transaction.formatted_receipt

