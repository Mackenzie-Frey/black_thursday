require './test/test_helper'

class ItemRepositoryTest < Minitest::Test

  def test_it_exists
    i = ItemRepository.new('./test/item_sample.csv')
    assert_instance_of ItemRepository, i
  end

  def test_it_can_create_items
    i = ItemRepository.new('./test/item_sample.csv')
    assert_instance_of Array, i.create_item("./test/item_sample.csv")
  end

  def test_item_repo_has_items
    i = ItemRepository.new('./test/item_sample.csv')
    assert_equal 3, i.all.count
  end

  def test_it_finds_by_id
    i = ItemRepository.new('./test/item_sample.csv')
    item = i.items[1]
    assert_equal item, i.find_by_id(263397059)
  end

end
