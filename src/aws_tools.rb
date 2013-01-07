require 'bundler/setup'
require 'fog'

module AwsTools
  VERSION = '0.0.1'

  autoload :Commands,  'aws_tools/commands'
  autoload :S3Helpers, 'aws_tools/s3_helpers'

  if File.basename($0) == File.basename(__FILE__)
    Commands.run(*ARGV)
  end
end

