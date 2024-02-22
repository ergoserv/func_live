# frozen_string_literal: true

require_relative "func_live/client"
require_relative "func_live/version"

module FuncLive
  class Error < StandardError; end

  class << self
    def default_token
      ENV["FUNC_LIVE_TOKEN"]
    end

    def token=(token) # rubocop:disable Style/TrivialAccessors
      @token = token
    end

    def token
      if @token.to_s.empty? && default_token.to_s.empty?
        raise FuncLive::Error, "FuncLive.token is empty"
      end

      @token || default_token
    end

    def client
      @client ||= FuncLive::Client.new(token)
    end

    def call(function_name, input = nil)
      response = client.functions(function_name, input)

      if response["success"] == false
        raise FuncLive::Error, response["error"]
      end

      response["output"]
    end
  end
end
