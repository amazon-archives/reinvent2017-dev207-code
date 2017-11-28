require 'aws-record'
require 'securerandom'

class Item
  include Aws::Record
  include ActiveModel::Validations

  string_attr :uuid, hash_key: true
  string_attr :body
  datetime_attr :created_date
  datetime_attr :updated_date

  validates_presence_of(:uuid, :body, :created_date, :updated_date)

  def self.create_item(opts)
    item = new
    item.uuid = SecureRandom.uuid
    item.body = opts["body"]
    now = Time.now.utc
    item.created_date = now
    item.updated_date = now
    item
  end

  def update_item(opts)
    self.body = opts["body"]
    self.updated_date = Time.now.utc
  end

  def self.list_page(limit: 20, next_token: nil)
    exclusive_start_key = nil
    if limit > 20
      limit = 20
    end
    resp = scan(
      projection_expression: "#H",
      exclusive_start_key: next_token_unencode(next_token),
      limit: limit,
      expression_attribute_names: { "#H" => "uuid" }
    )
    page_items = resp.page
    ids = page_items.map { |item| item.uuid }
    last_evaluated_key = resp.last_evaluated_key
    ret = {
      item_ids: ids,
      next_token: next_token_encode(last_evaluated_key)
    }
  end

  if Rails.env.production?
    set_table_name "reinventapi_Item_prod"
  else
    set_table_name "reinventapi_Item_dev"
  end

  private
  def self.next_token_encode(unencoded_key)
    if unencoded_key.nil?
      nil
    else
      value = unencoded_key["uuid"]
      base64 = Base64.encode64(value)
      encoded = URI.encode(base64)
    end
  end

  def self.next_token_unencode(encoded_key)
    if encoded_key.nil?
      nil
    else
      decoded = URI.decode(encoded_key)
      value = Base64.decode64(decoded)
      next_token = { "uuid" => value }
    end
  end
end
