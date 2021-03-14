if Rails.env.production?
  CarrierWave.configure do |config|
    config.fog_credentials = {
      # Amazon S3用の設定
      :provider              => 'AWS',
      :region                => ENV['ap-northeast-1'],     # 例: 'ap-northeast-1'
      :aws_access_key_id     => ENV['AKIAUYNEXPRANOYVRZPX'],
      :aws_secret_access_key => ENV['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']
    }
    config.fog_directory     =  ENV['tomosimages']
  end
end
