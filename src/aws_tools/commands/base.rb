module AwsTools
  module Commands
    class Base

      attr_reader :options

      def self.run(name, *args)
        name ||= 'aws-tools'

        # DEFAULTS
        options = {
          :region => 'us-east-1',
          :iam    => false
        }

        parser = OptionParser.new do |p|
          p.banner = "Usage: #{name} [options] #{arguments}".strip

          p.separator "Command options:"

          self.options p, options

          p.separator ''
          p.separator 'Global options:'

          p.on '--access-key-id [KEY]', 'Sets the AWS access key ID' do |key|
            options[:access_key_id] = key
          end

          p.on '--secret-access-key [KEY]', 'Sets the AWS secret access key' do |key|
            options[:secret_access_key] = key
          end

          p.on '--credentials [FILE]', 'Use the given credentials configuration file' do |file|
            options[:credentials] = file
          end

          p.on '--iam', 'Use IAM profile, only works on EC2.' do
            options[:iam] = true
          end

          p.on '-R', '--region REGION', 'Use the given AWS region' do |region|
            options[:region] = region
          end

          p.on_tail '-h', '--help', 'Show this message' do
            puts p
            exit
          end

          p.on_tail '-v', '--version', 'Show version' do
            puts "aws-tools version #{VERSION}"
            exit
          end
        end

        parser.parse!(args)

        new(parser, options).run(*args)
      end

      def self.arguments
        ""
      end

      def self.options(parser, options)
        # Nothing here
      end

      def initialize(parser, options)
        @parser  = parser
        @options = options
      end

      def run(*args)
        puts <<-OUT
Usage: aws-tools COMMAND [options] [<args>]

The most commonly used git commands are:
   s3-get-object      Get an object a given S3 bucket and path

See 'aws-tools <command> -h' for more information on a specific command.'
        OUT
      end

    private

      def help
        puts @parser
      end
    end

  end
end
