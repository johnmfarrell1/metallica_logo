# frozen_string_literal: true

module MetallicaLogo
  # value object for storing the response of a logo
  # generation request
  class Result
    attr_reader :file, :token, :result

    def initialize(data)
      @file = "#{MetallicaLogo::BASE_URL}/#{data['file']}"
      @token = data['token']
      @result = data['result']
    end
  end
end
