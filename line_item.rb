class LineItem

  include Virtus.model(:strict => true)

  attribute :quantity, Integer
  attr_accessor :product


  def tax_total
      self.quantity * self.product.total_tax
  end

  def total
      self.quantity * self.product.price_including_total_tax
  end

  def name
      self.product.name
  end


end