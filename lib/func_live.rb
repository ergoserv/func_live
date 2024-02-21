# frozen_string_literal: true

require_relative "func_live/client"
require_relative "func_live/version"

module FuncLive
  class Error < StandardError; end

  class << self
    def token=(token) # rubocop:disable Style/TrivialAccessors
      @token = token
    end

    def token
      @token || ENV["FUNC_LIVE_TOKEN"]
    end

    def client
      @client ||= FuncLive::Client.new(token)
    end

    def call(function_name, input = nil)
      response = client.functions(function_name, input)

      raise FuncLive::Error, response["error"] if response["success"] == false

      response["output"]
    end
  end
end
