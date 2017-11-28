require 'seahorse/client/plugins/content_length.rb'
require 'aws-sdk-core/plugins/logging.rb'
require 'aws-sdk-core/plugins/param_converter.rb'
require 'aws-sdk-core/plugins/param_validator.rb'
require 'aws-sdk-core/plugins/user_agent.rb'
require 'aws-sdk-core/plugins/helpful_socket_errors.rb'
require 'aws-sdk-core/plugins/retry_errors.rb'
require 'aws-sdk-core/plugins/global_configuration.rb'
require 'aws-sdk-core/plugins/response_paging.rb'
require 'aws-sdk-core/plugins/stub_responses.rb'
require 'aws-sdk-core/plugins/idempotency_token.rb'
require 'aws-sdk-core/plugins/jsonvalue_converter.rb'
require 'aws-sdk-core/plugins/protocols/api_gateway.rb'
require 'aws-sdk-core/plugins/api_key.rb'
require 'aws-sdk-core/plugins/apig_authorizer_token.rb'
require 'aws-sdk-core/plugins/apig_credentials_configuration.rb'
require 'recordapi-sdk/plugins/authorizer.rb'
require 'recordapi-sdk/plugins/apig_endpoint.rb'

Aws::Plugins::GlobalConfiguration.add_identifier(:recordapi)

module Recordapi
  class Client < Seahorse::Client::Base

    include Aws::ClientStubs

    @identifier = :recordapi

    set_api(ClientApi::API)

    add_plugin(Seahorse::Client::Plugins::ContentLength)
    add_plugin(Aws::Plugins::Logging)
    add_plugin(Aws::Plugins::ParamConverter)
    add_plugin(Aws::Plugins::ParamValidator)
    add_plugin(Aws::Plugins::UserAgent)
    add_plugin(Aws::Plugins::HelpfulSocketErrors)
    add_plugin(Aws::Plugins::RetryErrors)
    add_plugin(Aws::Plugins::GlobalConfiguration)
    add_plugin(Aws::Plugins::ResponsePaging)
    add_plugin(Aws::Plugins::StubResponses)
    add_plugin(Aws::Plugins::IdempotencyToken)
    add_plugin(Aws::Plugins::JsonvalueConverter)
    add_plugin(Aws::Plugins::Protocols::ApiGateway)
    add_plugin(Aws::Plugins::ApiKey)
    add_plugin(Aws::Plugins::APIGAuthorizerToken)
    add_plugin(Aws::Plugins::APIGCredentialsConfiguration)
    add_plugin(Recordapi::Plugins::Authorizer)
    add_plugin(Recordapi::Plugins::APIGEndpoint)

    # @option options [String] :access_key_id
    #
    # @option options [String] :api_key
    #   When provided, `x-api-key` header will be injected with the value provided.
    #
    # @option options [Boolean] :convert_params (true)
    #   When `true`, an attempt is made to coerce request parameters into
    #   the required types.
    #
    # @option options [Aws::CredentialProvider] :credentials
    #   AWS Credentials options is only required when your API uses
    #   [AWS Signature Version 4](http://docs.aws.amazon.com/general/latest/gr/signature-version-4.html),
    #   more AWS Credentials Configuration Options are available [here](https://github.com/aws/aws-sdk-ruby#configuration).
    #
    # @option options [Aws::Log::Formatter] :log_formatter (Aws::Log::Formatter.default)
    #   The log formatter.
    #
    # @option options [Symbol] :log_level (:info)
    #   The log level to send messages to the `:logger` at.
    #
    # @option options [Logger] :logger
    #   The Logger instance to send log messages to.  If this option
    #   is not set, logging will be disabled.
    #
    # @option options [String] :profile
    #
    # @option options [Integer] :retry_limit (3)
    #   The maximum number of times to retry failed requests.  Only
    #   ~ 500 level server errors and certain ~ 400 level client errors
    #   are retried.  Generally, these are throttling errors, data
    #   checksum errors, networking errors, timeout errors and auth
    #   errors from expired credentials.
    #
    # @option options [String] :secret_access_key
    #
    # @option options [String] :session_token
    #
    # @option options [Boolean] :stub_responses (false)
    #   Causes the client to return stubbed responses. By default
    #   fake responses are generated and returned. You can specify
    #   the response data to return or errors to raise by calling
    #   {ClientStubs#stub_responses}. See {ClientStubs} for more information.
    #
    #   ** Please note ** When response stubbing is enabled, no HTTP
    #   requests are made, and retries are disabled.
    #
    # @option options [Boolean] :validate_params (true)
    #   When `true`, request parameters are validated before
    #   sending the request.
    #
    def initialize(*args)
      super
    end

    # @!group API Operations

    # Creates a new item.
    #
    # @option params [required, Types::ItemInput] :item_input
    #
    # @return [Types::CreateItemResponse] Returns a {Seahorse::Client::Response response} object which responds to the following methods:
    #
    #   * {Types::CreateItemResponse#item_structure #item_structure} => Types::ItemStructure
    #
    # @example Request syntax with placeholder values
    #
    #   resp = client.create_item({
    #     item_input: { # required
    #       body: "__string",
    #     },
    #   })
    #
    # @example Response structure
    #
    #   resp.item_structure.item.body #=> String
    #   resp.item_structure.item.created_date #=> String
    #   resp.item_structure.item.updated_date #=> String
    #   resp.item_structure.item.uuid #=> String
    #
    # @overload create_item(params = {})
    # @param [Hash] params ({})
    def create_item(params = {}, options = {})
      req = build_request(:create_item, params)
      req.send_request(options)
    end

    # Deletes an existing item.
    #
    # @option params [required, String] :uuid
    #   The unique identifier of the item to be deleted.
    #
    # @return [Types::DeleteItemResponse] Returns a {Seahorse::Client::Response response} object which responds to the following methods:
    #
    #   * {Types::DeleteItemResponse#empty #empty} => Types::Empty
    #
    # @example Request syntax with placeholder values
    #
    #   resp = client.delete_item({
    #     uuid: "__string", # required
    #   })
    #
    # @example Response structure
    #
    #
    #
    # @overload delete_item(params = {})
    # @param [Hash] params ({})
    def delete_item(params = {}, options = {})
      req = build_request(:delete_item, params)
      req.send_request(options)
    end

    # Gets an existing item from the data store.
    #
    # @option params [required, String] :uuid
    #   The unique identifier of the item to retreive.
    #
    # @return [Types::GetItemResponse] Returns a {Seahorse::Client::Response response} object which responds to the following methods:
    #
    #   * {Types::GetItemResponse#item_structure #item_structure} => Types::ItemStructure
    #
    # @example Request syntax with placeholder values
    #
    #   resp = client.get_item({
    #     uuid: "__string", # required
    #   })
    #
    # @example Response structure
    #
    #   resp.item_structure.item.body #=> String
    #   resp.item_structure.item.created_date #=> String
    #   resp.item_structure.item.updated_date #=> String
    #   resp.item_structure.item.uuid #=> String
    #
    # @overload get_item(params = {})
    # @param [Hash] params ({})
    def get_item(params = {}, options = {})
      req = build_request(:get_item, params)
      req.send_request(options)
    end

    # Lists item identifiers in pages of up to 20.
    #
    # @option params [String] :limit
    #   Optional parameter to specify a response page size limit. Maximum
    #   value of 20.
    #
    # @option params [String] :next_token
    #   Optional parameter to specify the start token of the next response
    #   page. If a ListItems call is truncated, you should use the NextToken
    #   value from that response.
    #
    # @return [Types::ListItemsResponse] Returns a {Seahorse::Client::Response response} object which responds to the following methods:
    #
    #   * {Types::ListItemsResponse#item_id_collection #item_id_collection} => Types::ItemIdCollection
    #
    # @example Request syntax with placeholder values
    #
    #   resp = client.list_items({
    #     limit: "__string",
    #     next_token: "__string",
    #   })
    #
    # @example Response structure
    #
    #   resp.item_id_collection.item_ids #=> Array
    #   resp.item_id_collection.item_ids[0] #=> String
    #   resp.item_id_collection.next_token #=> String
    #
    # @overload list_items(params = {})
    # @param [Hash] params ({})
    def list_items(params = {}, options = {})
      req = build_request(:list_items, params)
      req.send_request(options)
    end

    # Updates an existing item, and returns the new item.
    #
    # @option params [required, Types::ItemInput] :item_input
    #
    # @option params [required, String] :uuid
    #   The unique identifier of the item to be updated.
    #
    # @return [Types::UpdateItemResponse] Returns a {Seahorse::Client::Response response} object which responds to the following methods:
    #
    #   * {Types::UpdateItemResponse#item_structure #item_structure} => Types::ItemStructure
    #
    # @example Request syntax with placeholder values
    #
    #   resp = client.update_item({
    #     item_input: { # required
    #       body: "__string",
    #     },
    #     uuid: "__string", # required
    #   })
    #
    # @example Response structure
    #
    #   resp.item_structure.item.body #=> String
    #   resp.item_structure.item.created_date #=> String
    #   resp.item_structure.item.updated_date #=> String
    #   resp.item_structure.item.uuid #=> String
    #
    # @overload update_item(params = {})
    # @param [Hash] params ({})
    def update_item(params = {}, options = {})
      req = build_request(:update_item, params)
      req.send_request(options)
    end

    # @!endgroup

    # @param params ({})
    # @api private
    def build_request(operation_name, params = {})
      handlers = @handlers.for(operation_name)
      authorizer = nil
      if config.api.operation(operation_name).authorizer
        authorizer_name = config.api.operation(operation_name).authorizer
        config.api.authorizers.each do |_, auth|
          authorizer = auth if auth.name == authorizer_name
        end
      end
      context = Seahorse::Client::RequestContext.new(
        operation_name: operation_name,
        operation: config.api.operation(operation_name),
        authorizer: authorizer,
        client: self,
        params: params,
        config: config)
      context[:gem_name] = 'recordapi-sdk'
      context[:gem_version] = '1.0.0'
      Seahorse::Client::Request.new(handlers, context)
    end

    # @api private
    # @deprecated
    def waiter_names
      []
    end

    class << self

      # @api private
      attr_reader :identifier

      # @api private
      def errors_module
        Errors
      end

    end
  end
end
