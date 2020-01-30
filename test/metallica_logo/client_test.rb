# frozen_string_literal: true

require 'test_helper'

# rubocop:disable Metrics/BlockLength
# Disable rubocop from warnings for large describe blocks in tests
describe MetallicaLogo::Client do
  describe 'logo generation' do
    before do
      @client = MetallicaLogo::Client.new
    end

    it 'should be generated given a string' do
      VCR.use_cassette('generate_logo') do
        logo = @client.generate_logo('metallica')
        assert_kind_of MetallicaLogo::Result, logo
        assert_equal 'http://metallica.alwaysdata.net/uploads/final/1580395706_1725507342.jpg',
                     logo.file
        assert_equal '1580395706_1725507342', logo.token
        assert_equal 'success', logo.result
      end
    end

    it 'should return server error for empty string (returns invalid json)' do
      VCR.use_cassette('empty_logo') do
        assert_raises MetallicaLogo::ServerError do
          @client.generate_logo('')
        end
      end
    end

    it 'should return request error for long string' do
      VCR.use_cassette('big_logo') do
        assert_raises MetallicaLogo::RequestError do
          @client.generate_logo('a' * 500)
        end
      end
    end

    it 'should raise an error for bad url' do
      VCR.use_cassette('bad_url') do
        assert_raises MetallicaLogo::ServerError do
          @client.send('post', 'http://metallica.alwaysdata.net/bad/', {})
        end
      end
    end

    describe 'with downloading' do
      before do
        @destination = Pathname('Metallica_test_logo.png')
      end

      it 'should save to expected location' do
        VCR.use_cassette('download_logo') do
          refute @destination.exist?
          @client.generate_and_download_logo('metallica', @destination)
          assert @destination.exist?
        end
      end

      it 'should raise an error if download location doesnt exist' do
        VCR.use_cassette('bad_download_url') do
          assert_raises MetallicaLogo::ServerError do
            @client.send(:download, 'http://metallica.alwaysdata.net/uploads/final/er.jpg')
          end
        end
      end

      after do
        @destination.delete if @destination.exist?
      end
    end
  end
end
# rubocop:enable Metrics/BlockLength
