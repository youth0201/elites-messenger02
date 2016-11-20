class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         
  #--************************** 下記を追加 *************************
  # サムネイル画像にCarrierWaveで作成したUserThumbnailUploaderを使用
  mount_uploader :thumbnail, UserThumbnailUploader
  #--***************************************************************
end
