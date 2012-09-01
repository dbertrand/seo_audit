require 'anemone'

module SeoAudit

  class Auditor
    attr_accessor :errors

    def initialize(url, options={})
      raise ArgumentError, "Invalid URL" unless url && url?(url)
      @url = url
      @options = options
      @errors = []

      @page_checks = []
      @after_checks = []

      # load checkers
      Dir[File.join(File.dirname(__FILE__), 'checkers', '*.rb')].each {|file| require file }

      if SeoAudit.constants.map(&:to_sym).include? :PageCheckers
        SeoAudit::PageCheckers.constants.each do |check|
          @page_checks << SeoAudit::PageCheckers.const_get(check).new
        end
      end

      if SeoAudit.constants.map(&:to_sym).include? :AfterCheckers
        SeoAudit::AfterCheckers.constants.each do |check|
          @after_checks << SeoAudit::AfterCheckers.const_get(check).new
        end
      end

      puts "DEBUG #{@page_checks.size} page checks"
      puts "DEBUG #{@after_checks.size} after checks"

    end

    def run
      Anemone.crawl(@url) do |anemone|
        anemone.on_every_page do |page|

          @page_checks.each { |checker| puts checker.check(SeoAudit::Core::Page.new(page)) }

        end
      end
    end

    def output
      @errors.join "\r\n"
    end

    def url?(string)
      uri = URI.parse(string)
      !!uri.path and !!uri.scheme and %w( http https ).include?(uri.scheme)
    rescue URI::BadURIError
      false
    rescue URI::InvalidURIError
      false
    end

  end

end