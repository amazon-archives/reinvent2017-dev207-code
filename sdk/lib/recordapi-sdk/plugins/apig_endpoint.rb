module Recordapi
  module Plugins

    class APIGEndpoint < Seahorse::Client::Plugin

      # Note that in a real generated SDK, your endpoint is populated here.
      # However, since this is shared demo code, bring your own endpoint.
      def after_initialize(client)
        if client.config.endpoint.nil?
          client.config.endpoint = ENV["RECORD_API_ENDPOINT"]
        end
      end

    end
  end
end
