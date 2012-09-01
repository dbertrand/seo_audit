
module SeoAudit

  module Core

    class Checker

      def message
        'empty'
      end

    end

    class PageChecker < Checker
      def check(page)
      end
    end

    class AfterChecker < Checker
      def check
      end
    end

  end

end
