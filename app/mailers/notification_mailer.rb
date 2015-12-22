class NotificationMailer < ActionMailer::Base
  default from: "no-reply@yelp-esque-app.com"

  def comment_added(comment)
    @place = comment.place
    @place_owner = @place.user
    mail(to: @place_owner.email,
         subject: "YelpEsque! - Someone commented on your post about #{@place.name}!")
  end
end
