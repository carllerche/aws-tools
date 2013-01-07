require 'optparse'

module AwsTools
  module Commands

    autoload :Base,        'aws_tools/commands/base'
    autoload :S3GetObject, 'aws_tools/commands/s3_get_object'

    def self.run(*args)
      name, *args = args

      command =
        case name
        when 's3-get-object' then S3GetObject
        else
          args.unshift name
          Base
        end

      command.run(name, *args)
    end

  end
end
