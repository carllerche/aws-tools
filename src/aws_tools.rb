require 'bundler/setup'
require 'fog'

module AwsTools
  VERSION = '0.0.1'

  autoload :Commands, 'aws_tools/commands'

  if File.basename($0) == File.basename(__FILE__)
    Commands.run(*ARGV)
  end
end

