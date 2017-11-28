module Recordapi
  # @api private
  module ClientApi

    include Seahorse::Model

    CreateItemRequest = Shapes::StructureShape.new(name: 'CreateItemRequest')
    CreateItemResponse = Shapes::StructureShape.new(name: 'CreateItemResponse')
    DeleteItemRequest = Shapes::StructureShape.new(name: 'DeleteItemRequest')
    DeleteItemResponse = Shapes::StructureShape.new(name: 'DeleteItemResponse')
    Empty = Shapes::StructureShape.new(name: 'Empty')
    Error = Shapes::StructureShape.new(name: 'Error')
    GetItemRequest = Shapes::StructureShape.new(name: 'GetItemRequest')
    GetItemResponse = Shapes::StructureShape.new(name: 'GetItemResponse')
    Item = Shapes::StructureShape.new(name: 'Item')
    ItemIdCollection = Shapes::StructureShape.new(name: 'ItemIdCollection')
    ItemInput = Shapes::StructureShape.new(name: 'ItemInput')
    ItemStructure = Shapes::StructureShape.new(name: 'ItemStructure')
    ListItemsRequest = Shapes::StructureShape.new(name: 'ListItemsRequest')
    ListItemsResponse = Shapes::StructureShape.new(name: 'ListItemsResponse')
    ListOf__string = Shapes::ListShape.new(name: 'ListOf__string')
    NotFoundException = Shapes::StructureShape.new(name: 'NotFoundException')
    UpdateItemRequest = Shapes::StructureShape.new(name: 'UpdateItemRequest')
    UpdateItemResponse = Shapes::StructureShape.new(name: 'UpdateItemResponse')
    __boolean = Shapes::BooleanShape.new(name: '__boolean')
    __double = Shapes::FloatShape.new(name: '__double')
    __integer = Shapes::IntegerShape.new(name: '__integer')
    __string = Shapes::StringShape.new(name: '__string')
    __timestamp = Shapes::TimestampShape.new(name: '__timestamp', timestampFormat: "iso8601")

    CreateItemRequest.add_member(:item_input, Shapes::ShapeRef.new(shape: ItemInput, required: true, location_name: "ItemInput"))
    CreateItemRequest.struct_class = Types::CreateItemRequest
    CreateItemRequest[:payload] = :item_input
    CreateItemRequest[:payload_member] = CreateItemRequest.member(:item_input)

    CreateItemResponse.add_member(:item_structure, Shapes::ShapeRef.new(shape: ItemStructure, required: true, location_name: "ItemStructure"))
    CreateItemResponse.struct_class = Types::CreateItemResponse
    CreateItemResponse[:payload] = :item_structure
    CreateItemResponse[:payload_member] = CreateItemResponse.member(:item_structure)

    DeleteItemRequest.add_member(:uuid, Shapes::ShapeRef.new(shape: __string, required: true, location: "uri", location_name: "uuid"))
    DeleteItemRequest.struct_class = Types::DeleteItemRequest

    DeleteItemResponse.add_member(:empty, Shapes::ShapeRef.new(shape: Empty, required: true, location_name: "Empty"))
    DeleteItemResponse.struct_class = Types::DeleteItemResponse
    DeleteItemResponse[:payload] = :empty
    DeleteItemResponse[:payload_member] = DeleteItemResponse.member(:empty)

    Empty.struct_class = Types::Empty

    Error.add_member(:code, Shapes::ShapeRef.new(shape: __string, location_name: "code"))
    Error.add_member(:message, Shapes::ShapeRef.new(shape: __string, location_name: "message"))
    Error.add_member(:retriable, Shapes::ShapeRef.new(shape: __boolean, location_name: "retriable"))
    Error.struct_class = Types::Error

    GetItemRequest.add_member(:uuid, Shapes::ShapeRef.new(shape: __string, required: true, location: "uri", location_name: "uuid"))
    GetItemRequest.struct_class = Types::GetItemRequest

    GetItemResponse.add_member(:item_structure, Shapes::ShapeRef.new(shape: ItemStructure, required: true, location_name: "ItemStructure"))
    GetItemResponse.struct_class = Types::GetItemResponse
    GetItemResponse[:payload] = :item_structure
    GetItemResponse[:payload_member] = GetItemResponse.member(:item_structure)

    Item.add_member(:body, Shapes::ShapeRef.new(shape: __string, location_name: "body"))
    Item.add_member(:created_date, Shapes::ShapeRef.new(shape: __string, location_name: "created_date"))
    Item.add_member(:updated_date, Shapes::ShapeRef.new(shape: __string, location_name: "updated_date"))
    Item.add_member(:uuid, Shapes::ShapeRef.new(shape: __string, location_name: "uuid"))
    Item.struct_class = Types::Item

    ItemIdCollection.add_member(:item_ids, Shapes::ShapeRef.new(shape: ListOf__string, location_name: "item_ids"))
    ItemIdCollection.add_member(:next_token, Shapes::ShapeRef.new(shape: __string, location_name: "next_token"))
    ItemIdCollection.struct_class = Types::ItemIdCollection

    ItemInput.add_member(:body, Shapes::ShapeRef.new(shape: __string, location_name: "body"))
    ItemInput.struct_class = Types::ItemInput

    ItemStructure.add_member(:item, Shapes::ShapeRef.new(shape: Item, location_name: "item"))
    ItemStructure.struct_class = Types::ItemStructure

    ListItemsRequest.add_member(:limit, Shapes::ShapeRef.new(shape: __string, location: "querystring", location_name: "Limit"))
    ListItemsRequest.add_member(:next_token, Shapes::ShapeRef.new(shape: __string, location: "querystring", location_name: "NextToken"))
    ListItemsRequest.struct_class = Types::ListItemsRequest

    ListItemsResponse.add_member(:item_id_collection, Shapes::ShapeRef.new(shape: ItemIdCollection, required: true, location_name: "ItemIdCollection"))
    ListItemsResponse.struct_class = Types::ListItemsResponse
    ListItemsResponse[:payload] = :item_id_collection
    ListItemsResponse[:payload_member] = ListItemsResponse.member(:item_id_collection)

    ListOf__string.member = Shapes::ShapeRef.new(shape: __string)

    UpdateItemRequest.add_member(:item_input, Shapes::ShapeRef.new(shape: ItemInput, required: true, location_name: "ItemInput"))
    UpdateItemRequest.add_member(:uuid, Shapes::ShapeRef.new(shape: __string, required: true, location: "uri", location_name: "uuid"))
    UpdateItemRequest.struct_class = Types::UpdateItemRequest
    UpdateItemRequest[:payload] = :item_input
    UpdateItemRequest[:payload_member] = UpdateItemRequest.member(:item_input)

    UpdateItemResponse.add_member(:item_structure, Shapes::ShapeRef.new(shape: ItemStructure, required: true, location_name: "ItemStructure"))
    UpdateItemResponse.struct_class = Types::UpdateItemResponse
    UpdateItemResponse[:payload] = :item_structure
    UpdateItemResponse[:payload_member] = UpdateItemResponse.member(:item_structure)


    # @api private
    API = Seahorse::Model::Api.new.tap do |api|

      api.version = "2017-11-03T23:00:14Z"

      api.metadata = {
        "endpointPrefix" => "iaiuyv0jhj",
        "protocol" => "api-gateway",
        "serviceFullName" => "reinvent-record-api",
      }

      api.add_operation(:create_item, Seahorse::Model::Operation.new.tap do |o|
        o.name = "CreateItem"
        o.http_method = "POST"
        o.http_request_uri = "/prod/items"
        o['authtype'] = "none"
        o.input = Shapes::ShapeRef.new(shape: CreateItemRequest)
        o.output = Shapes::ShapeRef.new(shape: CreateItemResponse)
      end)

      api.add_operation(:delete_item, Seahorse::Model::Operation.new.tap do |o|
        o.name = "DeleteItem"
        o.http_method = "DELETE"
        o.http_request_uri = "/prod/items/{uuid}"
        o['authtype'] = "none"
        o.input = Shapes::ShapeRef.new(shape: DeleteItemRequest)
        o.output = Shapes::ShapeRef.new(shape: DeleteItemResponse)
      end)

      api.add_operation(:get_item, Seahorse::Model::Operation.new.tap do |o|
        o.name = "GetItem"
        o.http_method = "GET"
        o.http_request_uri = "/prod/items/{uuid}"
        o['authtype'] = "none"
        o.input = Shapes::ShapeRef.new(shape: GetItemRequest)
        o.output = Shapes::ShapeRef.new(shape: GetItemResponse)
        o.errors << Shapes::ShapeRef.new(shape: NotFoundException)
      end)

      api.add_operation(:list_items, Seahorse::Model::Operation.new.tap do |o|
        o.name = "ListItems"
        o.http_method = "GET"
        o.http_request_uri = "/prod/items"
        o['authtype'] = "none"
        o.input = Shapes::ShapeRef.new(shape: ListItemsRequest)
        o.output = Shapes::ShapeRef.new(shape: ListItemsResponse)
        o.errors << Shapes::ShapeRef.new(shape: NotFoundException)
      end)

      api.add_operation(:update_item, Seahorse::Model::Operation.new.tap do |o|
        o.name = "UpdateItem"
        o.http_method = "PATCH"
        o.http_request_uri = "/prod/items/{uuid}"
        o['authtype'] = "none"
        o.input = Shapes::ShapeRef.new(shape: UpdateItemRequest)
        o.output = Shapes::ShapeRef.new(shape: UpdateItemResponse)
      end)
    end

  end
end
