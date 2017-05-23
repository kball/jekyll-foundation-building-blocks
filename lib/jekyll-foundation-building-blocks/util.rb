require 'net/http'

module JekyllFoundationBuildingBlocks
  module Util
    def self.fetch_url(url)
      uri = URI(url)
      Net::HTTP.get(uri)
    end

    def self.fetch_json(url)
      JSON.parse(self.fetch_url(url))
    end
  end
end
