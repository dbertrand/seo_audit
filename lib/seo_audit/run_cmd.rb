require 'optparse'

# Usage: seo_audit [options] path

options = {}
OptionParser.new do |opts|
  opts.banner = "Usage: seo_audit [options] path"

  opts.on("-d", "--debug", "Debug mode") do
    options['debug'] = true
  end

  opts.on_tail('-v', '--version', 'Show this version') do
    require 'seo_audit/version'
    puts SeoAudit::VERSION
    exit
  end

  opts.parse!
end

checker = SeoAudit::Checker.new(ARGV.first, options)
checker.run
checker.output
exit checker.errors.length
