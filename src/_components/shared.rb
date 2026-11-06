module Shared
  class Navbar < Bridgetown::Component
    attr_reader :metadata, :resource, :strategy

    # @param metadata [HashWithDotAccess::Hash]
    # @param resource [Bridgetown::Resource::Base]
    def initialize(metadata:, resource:)
      @metadata, @resource = metadata, resource

      @strategy = Willamette.navbar(
        self,
        logo: "/images/logotype_ancbs.svg",
        logo_alt: "Archives at NCBS",
        search: true,
        site_title: metadata.title,
        nav_links: [
          Willamette.link(title: t("nav.catalogue"), url: "https://catalogue.archives.ncbs.res.in"),
          Willamette.link(title: t("nav.access"), url: "/access"),
          Willamette.link(title: t("nav.thesilverfish"), url: "https://thesilverfish.archives.ncbs.res.in"),
          Willamette.link(title: t("nav.blog"), url: "/blog"),
          Willamette.link(title: t("nav.about"), url: "/about"),
          # Willamette.link(icon: "mastodon", icon_family: "brands", icon_label: "Mastodon", title: nil, url: "https://mastodon.social"),
        ]
      )
    end
  end

  class Sidebar < Bridgetown::Component
    attr_reader :metadata, :resource, :strategy

    # @param metadata [HashWithDotAccess::Hash]
    # @param resource [Bridgetown::Resource::Base]
    def initialize(metadata:, resource:)
      @metadata, @resource = metadata, resource

      explore_links = if resource.is_a?(Bridgetown::Resource::Base) && resource.collection.label == "docs"
                        Willamette.links_for(resource)
                      end

      @strategy = Willamette.sidebar(
        self,
        description: metadata.description,
        explore_links:,
        follow_links: [
          # Willamette.link(icon: "rss", title: "Newsfeed", url: "/feed.xml"),
          # Willamette.link(icon: "bluesky", icon_family: "brands", title: "@myblue", url: "https://bsky.social"),
          Willamette.link(icon: "instagram", icon_family: "brands", title: "@archives_ncbs", url: "https://instagram.com/archives_ncbs"),
          Willamette.link(icon: "facebook", icon_family: "brands", title: "@archives_ncbs", url: "https://facebook.com/archives_ncbs"),
          Willamette.link(icon: "twitter", icon_family: "brands", title: "@archives_ncbs", url: "https://x.com/archives_ncbs"),
        ],
        subscribe: false,
        see_also_links: [
          # Willamette.link(icon: "file-lines", title: "Catalogue", url: "https://catalogue.archives.cnbs.res.in"),
          Willamette.link(icon: "keyboard", title: "Program for the Archiving of Science and Technology", url: "/past"),
        ]
      )
    end
  end
end
