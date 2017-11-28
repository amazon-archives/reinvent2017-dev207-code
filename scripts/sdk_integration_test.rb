require 'recordapi-sdk'

client = Recordapi::Client.new
resp = client.create_item(item_input: { body: "TestItem" })
item = client.get_item(uuid: resp.item_structure.item.uuid)
raise "Invalid item body!" unless item.item_structure.item.body == "TestItem"
client.delete_item(uuid: item.item_structure.item.uuid)
