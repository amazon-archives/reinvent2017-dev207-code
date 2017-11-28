Before("@recordapi") do
  @service = Recordapi::Resource.new
  @client = @service.client
end

After("@recordapi") do
  # shared cleanup logic
end
