if Rails.env.production?
  CarrierWave.configure do |config|
    config.root = Rails.root.join('tmp') # adding these...
    config.cache_dir = 'carrierwave' # ...two lines
    config.fog_credentials = {
      # Configuration for Amazon S3
      :provider => 'AWS',
      :aws_access_key_id => ENV['AKIAJ4IUIOTMD556KNHA'],
      :aws_secret_access_key => ENV['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'],
      :region                 => 'ap-southeast-1'
    }
    config.fog_directory = ENV['rubyjolapp']
    config.fog_public     = false                                   # optional, defaults to true
    config.fog_attributes = {'Cache-Control'=>'max-age=315576000'}  # optional, defaults to {}

  end
end