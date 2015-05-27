#!/usr/bin/env ruby

require 'csv'
require 'virtus'

require './product.rb'
require './line_item.rb'
require './transaction.rb'



if __FILE__==$0

    csv_pathname = ARGV[0]

    transaction = Transaction.new
    transaction.parse_line_items_from_csv(csv_pathname)

    puts transaction.formatted_receipt

end

