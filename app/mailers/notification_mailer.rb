class NotificationMailer < ActionMailer::Base
  default from: "no-reply@yelp-esque-app.com"

  def comment_added
    mail(to: "ken.ho@hotmail.co.uk", subject: "YelpEsque! - Someone commented on your place!")
  end
end
