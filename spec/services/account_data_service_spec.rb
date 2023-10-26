require 'rails_helper'

RSpec.describe AccountDataService do
  describe "happy path" do
  	it "returns account balances" do

      VCR.use_cassette("account_balance") do
        data = AccountDataService.get_account_balance()

        expect(data).to be_kind_of(Hash)
        expect(data[:error]).to be_empty
        expect(data[:result][:ADA]).to eq("200.75362864")
        expect(data[:result][:XXRP]).to eq("102.37510238")
      end
  	end
  end
end