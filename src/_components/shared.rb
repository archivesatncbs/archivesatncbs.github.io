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
        search: false,
        site_title: metadata.title,
        nav_links: [
          Willamette.link(title: t("nav.home"), url: "/"),
          Willamette.link(title: t("nav.catalogue"), url: "https://catalogue.archives.ncbs.res.in"),
          Willamette.link(title: t("nav.access"), url: "/access"),
          Willamette.link(title: t("nav.updates"), url: "/updates"),
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
          Willamette.link(icon: "instagram", icon_family: "brands", title: "Instagram", url: "https://instagram.com/archives_ncbs"),
          Willamette.link(icon: "flickr", icon_family: "brands", title: "Flickr", url: "https://www.flickr.com/archivesatncbs"),
          Willamette.link(icon: "facebook", icon_family: "brands", title: "Facebook", url: "https://www.facebook.com/archives.at.NCBS"),
          Willamette.link(icon: "x-twitter", icon_family: "brands", title: "Twitter", url: "https://x.com/Archives_NCBS"),
          Willamette.link(icon: "threads", icon_family: "brands", title: "Threads", url: "https://www.threads.com/@archives_ncbs"),
        ],
        subscribe: false,
        see_also_links: [
          Willamette.link(icon: "box-archive", title: "PAST: Program for the Archiving of Science and Technology", url: "/past"),
          Willamette.link(icon: "newspaper", title: "The SilverFish", url: "https://thesilverfish.archives.ncbs.res.in"),
          Willamette.link(icon: "gavel", title: "Archives, Ethics and the Law in India", url: "https://ethics-law.archives.ncbs.res.in"),
          Willamette.link(icon: "fan", title: "13 Ways", url: "https://stories.archives.ncbs.res.in/exhibit/13ways"),
        ]
      )
    end
  end
end
