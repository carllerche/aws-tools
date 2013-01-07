module AwsTools
  module Commands
    class S3GetObject < Base
      include S3Helpers

      def self.arguments
        "BUCKET PATH"
      end

      def self.options(p, options)
        p.on '-o', '--output [FILE]', 'Write the output to the given file' do |out|
          options[:out] = out
        end

        p.on '--if-match [ETAG]', 'Only return the file if it matches the given etag' do |etag|
          options[:if_match] = etag
        end

        p.on '-if-none-match [ETAG]', 'Only return the file if it does not match the given etag' do |etag|
          options[:if_none_match] = etag
        end
      end

      def run(bucket, path)
        raise NotImplementedError if options[:if_match]

        dir = s3.directories.new(:key => bucket)
        p dir.files.get(:key => pah)
      end
    end

  end
end
