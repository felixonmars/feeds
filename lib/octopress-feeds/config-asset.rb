module Octopress
  module Feeds
    class Config < Ink::Assets::Config
      def read
        config = super
        if defined? Octopress::Multilingual
          config = Jekyll::Utils.deep_merge_hashes(multilingual_permalinks, config)
        end
        config
      end

      def multilingual_permalinks
        lang = Octopress.site.config['lang']
        { "permalinks" => {
          "main-feed"    => "/#{lang}/feed/",
          "link-feed"    => "/#{lang}/feed/links/",
          "article-feed" => "/#{lang}/feed/articles/"
        }}
      end
    end
  end
end