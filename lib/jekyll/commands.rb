$:.unshift File.expand_path("../../", File.dirname(__FILE__)) # load from jekyll-foundation-building-blocks/lib
require 'jekyll-foundation-building-blocks/blocks'
require 'jekyll-foundation-building-blocks/kits'
module Jekyll
  module Commands
    class FoundationBuildingBlocks < Command
      class << self
        def init_with_program(prog)
          prog.command(:blocks) do |c|
            c.syntax "blocks <SUBCOMMAND> "
            c.description "List and install Foundation Building Blocks"
            c.command(:list) do |sub|
              sub.syntax "blocks list"
              sub.description "List available Foundation Building Blocks"
              sub.action do |args, options|
                JekyllFoundationBuildingBlocks::Blocks.list
              end
            end
            c.command(:install) do |sub|
              sub.syntax "blocks install BLOCK_NAME"
              sub.description "Install Foundation Building Blocks"
              sub.action do |args, options|
                JekyllFoundationBuildingBlocks::Blocks.install(args[0])
              end
            end
          end
        end
      end
    end

    class FoundationKits < Command
      class << self
        def init_with_program(prog)
          prog.command(:kits) do |c|
            c.syntax "kits <SUBCOMMAND> "
            c.description "List and install Foundation Kits"
            c.command(:list) do |sub|
              sub.syntax "kits list"
              sub.description "List available Foundation Kits"
              sub.action do |args, options|
                JekyllFoundationBuildingBlocks::Kits.list
              end
            end
            c.command(:install) do |sub|
              sub.syntax "kits install KIT_NAME"
              sub.description "Install Foundation Kits"
              sub.action do |args, options|
                JekyllFoundationBuildingBlocks::Kits.install(args[0])
              end
            end
          end
        end
      end
    end
  end
end
