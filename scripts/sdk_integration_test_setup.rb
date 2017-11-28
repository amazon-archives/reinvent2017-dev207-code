require 'aws-sdk-apigateway'

client = Aws::APIGateway::Client.new(region: "us-west-2")

sdk_resp = client.get_sdk(
  rest_api_id: ENV["API_GATEWAY_API_ID"],
  stage_name: ENV["API_GATEWAY_STAGE_NAME"],
  sdk_type: "ruby",
  parameters: { "service.name" => "RecordApi" }
)
sdk_body = sdk_resp.body.read
File.write("rubysdk-output.zip", sdk_body)
`unzip rubysdk-output.zip`
`mv generated_src test-sdk`
