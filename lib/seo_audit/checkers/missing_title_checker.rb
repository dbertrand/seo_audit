module SeoAudit
  module PageCheckers

    class MissingTitleChecker < Core::PageChecker

      def check(page)
        !page.title.empty?
      end

    end

  end
end