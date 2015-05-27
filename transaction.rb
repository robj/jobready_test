class Transaction
  include Virtus.model(:strict => true)


    attr_accessor :line_items 


    def parse_line_items_from_csv(pathname)

           @line_items = []


            options = {:encoding => 'UTF-8', :skip_blanks => true}

            CSV.foreach(pathname, options).each_with_index do |row, row_index|

               #first row is a header
               unless row_index == 0

                  quantity = row[0].strip
                  name = row[1].strip
                  price = row[2].strip

                  product = Product.new(name: name, price: price) 
                  line_item = LineItem.new(quantity: quantity, product: product)

                  @line_items << line_item
               end

            end



    end



    def pad_currency(number)
        '%.2f' % number
    end


    def formatted_receipt

          receipt = ''
          transaction_sales_taxes = 0.0
          transaction_total = 0.0

          @line_items.each do |line_item|

                 receipt <<  "#{line_item.quantity}, #{line_item.name}, #{pad_currency(line_item.total)}\n"
                 transaction_sales_taxes = transaction_sales_taxes + line_item.tax_total
                 transaction_total = transaction_total + line_item.total
          end

          receipt << "\n"
          receipt << "Sales Taxes: #{pad_currency(transaction_sales_taxes)}\n"
          receipt << "Total: #{pad_currency(transaction_total)}"


    end


end