module Recordapi
  module Types

    # @note When making an API call, you may pass CreateItemRequest
    #   data as a hash:
    #
    #       {
    #         item_input: { # required
    #           body: "__string",
    #         },
    #       }
    #
    # @!attribute [rw] item_input
    #   @return [Types::ItemInput]
    #
    class CreateItemRequest < Struct.new(
      :item_input)
      include Aws::Structure
    end

    # @!attribute [rw] item_structure
    #   @return [Types::ItemStructure]
    #
    class CreateItemResponse < Struct.new(
      :item_structure)
      include Aws::Structure
    end

    # @note When making an API call, you may pass DeleteItemRequest
    #   data as a hash:
    #
    #       {
    #         uuid: "__string", # required
    #       }
    #
    # @!attribute [rw] uuid
    #   The unique identifier of the item to be deleted.
    #   @return [String]
    #
    class DeleteItemRequest < Struct.new(
      :uuid)
      include Aws::Structure
    end

    # @!attribute [rw] empty
    #   @return [Types::Empty]
    #
    class DeleteItemResponse < Struct.new(
      :empty)
      include Aws::Structure
    end

    class Empty < Aws::EmptyStructure; end

    # @!attribute [rw] code
    #   @return [String]
    #
    # @!attribute [rw] message
    #   @return [String]
    #
    # @!attribute [rw] retriable
    #   @return [Boolean]
    #
    class Error < Struct.new(
      :code,
      :message,
      :retriable)
      include Aws::Structure
    end

    # @note When making an API call, you may pass GetItemRequest
    #   data as a hash:
    #
    #       {
    #         uuid: "__string", # required
    #       }
    #
    # @!attribute [rw] uuid
    #   The unique identifier of the item to retreive.
    #   @return [String]
    #
    class GetItemRequest < Struct.new(
      :uuid)
      include Aws::Structure
    end

    # @!attribute [rw] item_structure
    #   @return [Types::ItemStructure]
    #
    class GetItemResponse < Struct.new(
      :item_structure)
      include Aws::Structure
    end

    # @!attribute [rw] body
    #   The body text of an item.
    #   @return [String]
    #
    # @!attribute [rw] created_date
    #   A timestamp string indicating the time of initial item creation.
    #   @return [String]
    #
    # @!attribute [rw] updated_date
    #   A timestamp string indicating the most recent time the item was
    #   updated.
    #   @return [String]
    #
    # @!attribute [rw] uuid
    #   The item's unique identifier.
    #   @return [String]
    #
    class Item < Struct.new(
      :body,
      :created_date,
      :updated_date,
      :uuid)
      include Aws::Structure
    end

    # @!attribute [rw] item_ids
    #   An array of item unique identifiers.
    #   @return [Array<String>]
    #
    # @!attribute [rw] next_token
    #   When present, indicates the response is truncated. Can be used as a
    #   next token input to a new ListItems request.
    #   @return [String]
    #
    class ItemIdCollection < Struct.new(
      :item_ids,
      :next_token)
      include Aws::Structure
    end

    # @note When making an API call, you may pass ItemInput
    #   data as a hash:
    #
    #       {
    #         body: "__string",
    #       }
    #
    # @!attribute [rw] body
    #   The new body text for an item.
    #   @return [String]
    #
    class ItemInput < Struct.new(
      :body)
      include Aws::Structure
    end

    # @!attribute [rw] item
    #   @return [Types::Item]
    #
    class ItemStructure < Struct.new(
      :item)
      include Aws::Structure
    end

    # @note When making an API call, you may pass ListItemsRequest
    #   data as a hash:
    #
    #       {
    #         limit: "__string",
    #         next_token: "__string",
    #       }
    #
    # @!attribute [rw] limit
    #   Optional parameter to specify a response page size limit. Maximum
    #   value of 20.
    #   @return [String]
    #
    # @!attribute [rw] next_token
    #   Optional parameter to specify the start token of the next response
    #   page. If a ListItems call is truncated, you should use the NextToken
    #   value from that response.
    #   @return [String]
    #
    class ListItemsRequest < Struct.new(
      :limit,
      :next_token)
      include Aws::Structure
    end

    # @!attribute [rw] item_id_collection
    #   @return [Types::ItemIdCollection]
    #
    class ListItemsResponse < Struct.new(
      :item_id_collection)
      include Aws::Structure
    end

    # @note When making an API call, you may pass UpdateItemRequest
    #   data as a hash:
    #
    #       {
    #         item_input: { # required
    #           body: "__string",
    #         },
    #         uuid: "__string", # required
    #       }
    #
    # @!attribute [rw] item_input
    #   @return [Types::ItemInput]
    #
    # @!attribute [rw] uuid
    #   The unique identifier of the item to be updated.
    #   @return [String]
    #
    class UpdateItemRequest < Struct.new(
      :item_input,
      :uuid)
      include Aws::Structure
    end

    # @!attribute [rw] item_structure
    #   @return [Types::ItemStructure]
    #
    class UpdateItemResponse < Struct.new(
      :item_structure)
      include Aws::Structure
    end

  end
end
