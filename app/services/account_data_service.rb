require 'faraday'
require 'base64'

# HMAC-SHA512 of (URI path + SHA256(nonce + POST data)) and base64 decoded secret API key

class AccountDataService
  def self.connection
    conn = Faraday.new(url: 'https://api.kraken.com')
  end

  def self.get_account_balance()
    uri_path = "/0/private/Balance"
    nonce = Time.now.to_i.to_s

    secret_key = decode_key

    post_data = "nonce=#{nonce}"
    sha = OpenSSL::Digest.new('sha256', nonce + post_data).digest
    message = uri_path + sha
    sig = Base64.strict_encode64(OpenSSL::HMAC.digest('sha512', secret_key, message))

    response = connection.post(uri_path) do |req|
      req.headers["API-Key"] = Rails.application.credentials[:account_api_key]
      req.headers["API-Sign"] = sig
      req.body = "nonce=#{nonce}"
    end

    JSON.parse(response.body, symbolize_names: true)
  end

  def self.decode_key
    key = Rails.application.credentials[:account_secret_key]
    Base64.decode64(key)
  end
end
