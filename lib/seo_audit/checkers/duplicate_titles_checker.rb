module SeoAudit
  module AfterCheckers

    class DuplicateTitlesChecker < SeoAudit::Core::AfterChecker

      def check
        return true
      end

    end

  end
end