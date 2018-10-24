require './test/test_helper'
require './lib/merchant_repository'

class MerchantRepositoryTest < Minitest::Test

  def test_it_exists
    mr = MerchantRepository.new(CSV.read("./data/merchants.csv", headers: true, header_converters: :symbol))
    assert_instance_of MerchantRepository, mr
  end

  def test_it_has_merchants
    mr = MerchantRepository.new(CSV.read("./data/merchants.csv", headers: true, header_converters: :symbol))
    expected = CSV.read("./data/merchants.csv", headers: true, header_converters: :symbol)
    assert_equal expected, mr.merchants
  end

  def test_it_creates_merchant_array
    # make an array of merchants
    
    # use test file

    assert_equal
  end

end