require 'pry'
require 'CSV'
# require_relative './invoice_item'
require_relative './repository'

class InvoiceItemRepository < Repository

  def new_record(row)
    InvoiceItem.new(row)
  end

end