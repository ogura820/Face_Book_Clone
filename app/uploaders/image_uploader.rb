class ImageUploader < CarrierWave::Uploader::Base

  include CarrierWave::MiniMagick
  process resize_to_fit: [400, 200]

  def extension_allowlist
    %w(jpg jpeg gif png)
  end
end
