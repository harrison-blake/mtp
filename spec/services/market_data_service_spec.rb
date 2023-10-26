require 'rails_helper'

RSpec.describe MarketDataService do
  describe "happy path" do
    let(:coin) { coin = 'ETH' }

  	it "returns price of given coin" do

      VCR.use_cassette("eth_token_info") do
        data = MarketDataService.get_current_price(coin)

        expect(data).to be_kind_of(Hash)
    		expect(data[:status][:error_code]).to eq(0)
        expect((data[:data][:ETH][0][:quote][:USD][:price]).round(2)).to eq(1553.92)
      end
  	end
  end
end