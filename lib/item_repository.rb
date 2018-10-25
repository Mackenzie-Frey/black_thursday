require 'pry'
require 'CSV'
require './lib/merchant'
require './lib/repo_module'

class ItemRepository

  include Repository

  attr_reader :repository

  def initialize(csv_items)
    @repository  = []
    create_item(csv_items)
  end

  def create_item(csv_items)
    row_objects = CSV.read(csv_items, headers: true, header_converters: :symbol)
      @repository = row_objects.map do |row|
        Item.new(row)
      end
  end

  def find_all_with_description(item_description)
    @repository.find_all do |item|
      item.description.upcase == item_description.upcase
    end
  end

  def find_all_by_price(price)
    @repository.find_all do |item|
      item.unit_price ==  BigDecimal.new(price)/100
    end
  end

  def find_all_by_price_in_range(range)
    @repository.find_all do |item|
      range.include?(item.unit_price)
    end
  end

  def find_all_by_merchant_id(merchant_id)
    @repository.find_all do |item|
      item.merchant_id == merchant_id
    end
  end

  def create(attributes)
    attributes[:id] = new_highest_id
    @repository << new_item = Item.new(attributes)
    new_item
  end

  def update(id, attributes)
    item = find_by_id(id)
    return item if item.nil?
    item.name = attributes[:name] unless attributes[:name].nil?
    item.description = attributes[:description] unless attributes[:description].nil?
    item.unit_price = attributes[:unit_price] unless attributes[:unit_price].nil?
    item.updated_at = Time.now
  end


end
