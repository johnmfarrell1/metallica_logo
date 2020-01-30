$LOAD_PATH.unshift File.expand_path("../../lib", __FILE__)
require 'metallica_logo'
require 'minitest/autorun'
require 'minitest-spec-context'
require 'vcr'
require 'webmock/minitest'

VCR.configure do |config|
  config.cassette_library_dir = 'test/vcr'
  config.hook_into :webmock
  config.allow_http_connections_when_no_cassette = true
end