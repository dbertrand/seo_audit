module SeoAudit
  module PageCheckers

    class TitleLengthChecker < Core::PageChecker

      def check(page)
        page.title.length <= 70
      end

      def message
        'Page title too long'
      end

    end

  end
end