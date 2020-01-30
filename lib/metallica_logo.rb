# frozen_string_literal: true

require 'metallica_logo/version'
require 'metallica_logo/result'
require 'metallica_logo/client'
require 'rest-client'
require 'json'
require 'pathname'

module MetallicaLogo
  class Error < StandardError; end
  class ServerError < Error; end
  class RequestError < Error; end

  BASE_URL = 'http://metallica.alwaysdata.net'
end
