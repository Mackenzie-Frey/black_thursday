class Transaction

  attr_reader :id,
              :invoice_id,
              :credit_card_number

  def initialize(transaction_data)
    @id = transaction_data[:id].to_i
    @invoice_id = transaction_data[:invoice_id].to_i
    @credit_card_number = transaction_data[:credit_card_number]
  end
end