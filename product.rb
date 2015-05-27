class Product

  include Virtus.model(:strict => true)

  SALES_TAX_RATE =  BigDecimal('0.10')
  IMPORT_DUTY_TAX_RATE = BigDecimal('0.05')
  ROUND_TO_NEAREST_AMOUNT_IN_DOLLAR = BigDecimal('0.05')
  ZERO = BigDecimal('0.0')

  attribute :name, String
  attribute :price, BigDecimal


  def is_imported?
    self.name =~ /imported/
  end 


  def is_sales_tax_exempt?
    return true if (self.name =~ /book/) || (self.name =~ /pills/) || (self.name =~ /chocolate/)
    false
  end


  def sales_tax
     self.is_sales_tax_exempt?  ? ZERO : (self.price * SALES_TAX_RATE)
  end


  def import_duty_tax
     self.is_imported? ? (self.price * IMPORT_DUTY_TAX_RATE) : ZERO
  end


  def rounded_value(input)
        number = (1 / ROUND_TO_NEAREST_AMOUNT_IN_DOLLAR)
        (input*number).ceil/number
  end

  def total_tax
    rounded_value(self.sales_tax + self.import_duty_tax)
  end


  def price_including_total_tax
    (self.price + self.total_tax).round(2)
  end


end

