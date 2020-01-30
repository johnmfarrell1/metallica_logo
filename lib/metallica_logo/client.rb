module MetallicaLogo
  class Client
    attr_reader :rest_klass, :base_url

    MAX_CHARACTERS = 25

    def initialize(base_url: MetallicaLogo::BASE_URL, rest_klass: RestClient)
      @rest_klass = rest_klass
      @base_url = base_url
    end

    def generate_logo(text)
      if text.size > MAX_CHARACTERS
        raise RequestError, "Too many characters, limit is #{MAX_CHARACTERS}"
      end

      response = post("#{@base_url}/creation/", { 'the_text': text })
      MetallicaLogo::Result.new(JSON.parse(response))
    end

    def generate_and_download_logo(text, destination_file)
      result = generate_logo(text)
      destination_file = Pathname(destination_file)
      destination_file.dirname.mkpath
      response = download(result.file)
      IO.binwrite(destination_file, response.body)
      destination_file
    end

    private

    def download(url)
      rest_klass.get(url)
    rescue rest_klass::ExceptionWithResponse => e
      validate_response(e.response)
    end

    def post(url, payload)
      response = rest_klass.post(url, payload)
      validate_response(response)
    rescue rest_klass::ExceptionWithResponse => e
      validate_response(e.response)
    end

    def validate_response(response)
      raise ServerError, 'Invalid JSON returned' unless valid_json?(response.body)

      case response.code.to_s
      when /2\d\d/ then response
      when /5\d\d/ then raise ServerError, response.body
      else
        raise RequestError, response.body
      end
    end

    def valid_json?(value)
      result = JSON.parse(value)
      result.is_a?(Hash)
    rescue JSON::ParserError
      false
    end
  end
end