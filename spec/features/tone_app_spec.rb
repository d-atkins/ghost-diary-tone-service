require 'spec_helper'

describe ToneApp do
  let(:app) {ToneApp.new}

  context "GET to /api/v1/tone" do
    let(:response) { get "/api/v1/tone",
      apikey: "PKOFUCaS7ZRdbbsRuuhrUZNxWnH4TXJYuY5nTExuv_5M",
      body: "I'm happy and excited to be happy. Happy, happy! Aren't you joyful?"}

    it "returns a status 200 OK, and a tone" do
      expect(response.body).to eq("\"Joy\"")
      expect(response.status).to eq(200)
    end
  end
end
