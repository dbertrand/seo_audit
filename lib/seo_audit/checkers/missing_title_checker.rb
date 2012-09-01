module SeoAudit
  module PageCheckers

    class MissingTitleChecker < Core::PageChecker

      def check(page)
        !page.title.empty?
      end

      def message
        'Missing Title Tag'
      end

    end

  end
end