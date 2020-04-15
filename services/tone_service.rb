require "faraday"

class ToneService

  def initialize(key)
    @key = key
  end

  def get_tone_by_text(text)
    response = conn.get("/v3/tone?version=2017-09-21") do |req|
      req.params['sentences'] = false
      req.params['text'] = text
    end
    JSON.parse(response.body, symbolize_names: true)
  end

  private

    def conn
      Faraday.new('https://api.us-south.tone-analyzer.watson.cloud.ibm.com/instances/95e82454-27aa-4915-a1e6-e206440f077f') do |f|
        f.use Faraday::Request::BasicAuthentication, 'apikey', @key
      end
    end

end
