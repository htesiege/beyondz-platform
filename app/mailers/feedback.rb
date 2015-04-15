require 'digest/sha2'
class Feedback < ActionMailer::Base
  default from: 'no-reply@beyondz.org'

  # needed because gmail was filtering some messages: http://blog.mailgun.com/tips-tricks-avoiding-gmail-spam-filtering-when-using-ruby-on-rails-action-mailer/
  default "Message-ID" => ->(v){"<#{Digest::SHA2.hexdigest(Time.now.to_i.to_s)}@beyondz.org>"}

  def feedback(from, message)
    @from = from
    @message = message
    mail(to: 'tech@beyondz.org', subject: 'Site Feedback')
  end
end
