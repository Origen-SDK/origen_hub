class QuickSignUp
  include NoBrainer::Document
  include NoBrainer::Document::Timestamps

  field :email
  field :unsubsribed, type: Boolean, default: false
  validates :email, email: true

  before_validation :clean_email

  scope :subscribed, -> { where(unsubsribed: false) }
  scope :unsubscribed, -> { where(unsubsribed: true) }

  def self.find_by_email(e)
    where(:email => /^#{e.strip}$/i).first
  end

  def clean_email
    if email
      self.email = email.strip
    end
  end
end
