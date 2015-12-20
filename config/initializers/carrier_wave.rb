if Rails.env.production?
  CarrierWave.configure do |config|
    config.fog_credentials = {
# Configuration for Amazon S3
:provider => 'AWS',
:aws_access_key_id => ENV['AKIAJ4IUIOTMD556KNHA'],
:aws_secret_access_key => ENV['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']
    }
    config.fog_directory = ENV['rubyjolapp']
  end
end