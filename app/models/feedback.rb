class Feedback < ActiveRecord::Base
  validates :user_name, presence: true
  validates :user_email, presence: true
  validates :body, presence: true

  def send_to_robots!
    RobotsMailer.feedback(self).deliver_now!
  end
end
