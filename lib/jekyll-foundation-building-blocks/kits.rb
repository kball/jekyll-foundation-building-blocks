require 'jekyll-foundation-building-blocks/util'
require 'colorator'
require 'jekyll-foundation-building-blocks/blocks'

module JekyllFoundationBuildingBlocks
  KITS_JSON_URL = "#{BLOCKS_ROOT}data/kits.json"

  module Kits
    def self.list
      Util.fetch_json(KITS_JSON_URL).each_with_index do |pair, i|
        key = pair[0]
        value = pair[1]
        Jekyll.logger.info "#{i})".green + " #{key}".cyan + ": #{value['total']} blocks"
      end
    end

    def self.install(key)
      kits = Util.fetch_json(KITS_JSON_URL)
      unless kits[key]
        Jekyll.logger.error "Could not find kit #{kit}"
        return 1
      end

      kits[key]['blocks'].each do |block|
        JekyllFoundationBuildingBlocks::Blocks.install(block['datakey'])
      end

      Jekyll.logger.info("installed kit: #{key}")
    end
  end
end
