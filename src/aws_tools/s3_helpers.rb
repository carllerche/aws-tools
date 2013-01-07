module AwsTools
  module S3Helpers
    def s3
      @s3 ||=
        begin
          opts = fog_basic_options
          Fog::Storage::AWS.new(opts)
        end
    end
  end
end
