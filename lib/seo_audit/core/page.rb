module SeoAudit
  module Core

    class Page < SimpleDelegator
      def initialize( anemone_page )
        super( anemone_page )
        @anemone_page = anemone_page
      end

      def title
        @anemone_page.doc.title
      end

    end
  end
end
