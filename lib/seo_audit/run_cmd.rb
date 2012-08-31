require 'optparse'

# Usage: seo_audit [options] path
#    -d, --debug                      debug mode
#    -v, --version                    show this version
#    -h, --help                       show this message

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

  opts.on_tail("-h", "--help", "Show help message") do
    puts opts
    exit
  end

  opts.parse!
end

checker = SeoAudit::Auditor.new(ARGV.first, options)
checker.run
puts checker.output
exit checker.errors.length
