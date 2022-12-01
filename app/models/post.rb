class Post < ApplicationRecord
  validates :title, presence: true
  validates :start_at, presence: true
  validates :end_at, presence: true

  validate :start_at_check
  def start_at_check
    if start_at.present? && end_at.present? && start_at < Date.today
      errors.add(:start_at, "は今日以降で入力してください")
    end
  end

  validate :end_at_check
  def end_at_check
    if start_at.present? && end_at.present? && start_at > end_at
      errors.add(:end_at, "は開始日より前の日付を設定できません")
    end
  end

end
