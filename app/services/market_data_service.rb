require 'faraday'

class MarketDataService
  def self.connection
    conn = Faraday.new(url: 'https://pro-api.coinmarketcap.com')
  end

  def self.get_current_price(coin_symbol)
    response = connection.get("v2/cryptocurrency/quotes/latest?symbol=#{coin_symbol}") do |req|
      req.headers["X-CMC_PRO_API_KEY"] = Rails.application.credentials[:market_data_key]
    end

    JSON.parse(response.body, symbolize_names: true)
  end
end