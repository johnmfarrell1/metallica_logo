# frozen_string_literal: true

require 'test_helper'

# rubocop:disable Metrics/BlockLength
# Disable rubocop from warnings for large describe blocks in tests
describe MetallicaLogo::Result do
  describe 'valid result' do
    before do
      @response_data = '{"file":"uploads\/final\/1580395706_1725507342.jpg","token":"1580395706_1725507342","result":"success"}'
      @response_json = JSON.parse(@response_data)
    end

    it 'should initialize with expected accessors' do
      logo = MetallicaLogo::Result.new(@response_json)
      assert_equal 'success', logo.result
      assert_equal '1580395706_1725507342', logo.token
      assert_equal 'http://metallica.alwaysdata.net/uploads/final/1580395706_1725507342.jpg',
                   logo.file
    end
  end
end
# rubocop:enable Metrics/BlockLength