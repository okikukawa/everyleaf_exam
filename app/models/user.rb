class User < ApplicationRecord
  before_create CreateAgeAtCallback.new
  before_create :ensure_has_name
  after_initialize do |user|
    p user
    puts "オブジェクトを生成しました！"
    user.name = "Taro"
  end
  private
  def ensure_has_name
    puts "nameの値をTaroに設定します！"
    self.name = 'Taro' if name.blank?
  end
end
