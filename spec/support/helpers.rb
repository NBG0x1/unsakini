module Helpers
  def auth_headers(user)
    user.create_new_auth_token.merge!(json_request_headers)
  end

  def json_request_headers
    {
      'Content-Type' => 'application/json',
      'Accept' => 'application/json'
    }
  end

  def body_as_json
    json_str_to_hash(response.body)
  end

  alias_method :body_as_hash, :body_as_json

  def json_str_to_hash(str)
    begin
      JSON.parse(str).with_indifferent_access
    rescue Exception => e
      begin
        JSON.parse(str)
      rescue Exception => e
        nil
      end
    end
  end

  def serialize(model_instance)
    # http://stackoverflow.com/questions/1235593/ruby-symbol-to-class
    begin
      serializer = "#{model_instance.class.name}Serializer".constantize
      ActiveModelSerializers::Adapter.create(serializer.new(model_instance))
    rescue Exception => e
      model_instance
    end
  end

  def model_as_hash(model_instance)
    json_str_to_hash(serialize(model_instance).to_json)
  end
end

RSpec.configure do |config|
  config.include Helpers
end