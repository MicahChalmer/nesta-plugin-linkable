module Nesta
  module Plugin
    module Linkable
      module Helpers
      end
    end
  end

  class App
    helpers Nesta::Plugin::Linkable::Helpers

    alias_method :path_to_without_linkable, :path_to
    def path_to(page_path, absolute = false)
      page = Nesta::Page.find_by_path(page_path)
      (page.nil? || !page.is_linked?) ? path_to_without_linkable(page_path, absolute) : page.metadata('url')
    end

  end

  class Page

    def is_linked?
      not self.metadata('url').nil?
    end

  end
end
