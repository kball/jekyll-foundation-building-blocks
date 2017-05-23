require 'net/http'

module JekyllFoundationBuildingBlocks
  module Util
    def self.fetch_url(url)
      uri = URI(url)
      response = Net::HTTP.get_response(uri)
      if response.code == "200"
        response.body
      else
        ''
      end
    end

    def self.fetch_json(url)
      JSON.parse(self.fetch_url(url))
    end
  end
end
