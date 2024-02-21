# frozen_string_literal: true

require "httparty"

module FuncLive
  class Client
    include HTTParty

    base_uri "https://api.func.live"

    def initialize(token)
      @headers = {
        "Content-Type" => "application/json",
        "Authorization" => "Bearer #{token}"
      }
    end

    def functions(function_name, input = nil)
      body = { input: input }
      self.class.post(
        "/functions/#{function_name}",
        headers: @headers,
        body: body.to_json
      )
    end
  end
end
