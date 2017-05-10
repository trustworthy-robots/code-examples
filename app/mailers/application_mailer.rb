class ApplicationMailer < ActionMailer::Base
  default from: HomePage.default_feedback_emails['default_sender']
  default to:   HomePage.default_feedback_emails['default_recipient']
  layout 'mailer'
end
