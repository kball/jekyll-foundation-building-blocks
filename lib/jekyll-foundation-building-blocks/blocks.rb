require 'jekyll-foundation-building-blocks/util'
require 'colorator'
require 'fileutils'

module JekyllFoundationBuildingBlocks
  BLOCKS_ROOT = "https://foundation.zurb.com/building-blocks/"
  BLOCKS_JSON_URL = "#{BLOCKS_ROOT}data/building-blocks.json"
  module Blocks
    def self.list
      Util.fetch_json(BLOCKS_JSON_URL).each_with_index do |pair, i|
        key = pair[0]
        value = pair[1]
        Jekyll.logger.info "#{i})".green + " #{key}".cyan + ":#{value['name']}"
      end
    end

    def self.install(key)
      self._install_partial(key)
      self._install_scss(key)
      self._install_js(key)
      Jekyll.logger.info("installed #{key}")
      # TODO: Any sort of auto-inclusion we want to set up
    end

    def self._install_partial(key)
      file = Util.fetch_url("#{BLOCKS_ROOT}/#{key}/#{key}.html")
      dir = File.join("_includes", "building-blocks")
      FileUtils.mkdir_p(dir)
      filename = "_#{key}.html".gsub('-', '_')
      File.open(File.join(dir, filename), 'w').write(file)
    end

    def self._install_scss(key)
      file = Util.fetch_url("#{BLOCKS_ROOT}/#{key}/#{key}.scss")
      dir = File.join("_sass", "components", "building-blocks")
      FileUtils.mkdir_p(dir)
      File.open(File.join(dir, "_#{key}.scss"), 'w').write(file)
    end

    def self._install_js(key)
      file = Util.fetch_url("#{BLOCKS_ROOT}/#{key}/#{key}.js")
      dir = File.join("js", "building-blocks")
      FileUtils.mkdir_p(dir)
      File.open(File.join(dir, "#{key}.js"), 'w').write(file)
    end

  end
end
