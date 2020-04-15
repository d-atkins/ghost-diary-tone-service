require 'sinatra'
require 'sinatra/contrib'
require './services/tone_service'
require './models/tone'

class ToneApp < Sinatra::Base
  register Sinatra::Namespace

  namespace '/api/v1' do
    before do
      content_type :json
    end

    get '/tone' do
      tone_service = ToneService.new(params[:apikey])
      tone_data = tone_service.get_tone_by_text(params[:body])
      tone = Tone.new(tone_data)
      tone.filter.to_json
    end
  end
end
