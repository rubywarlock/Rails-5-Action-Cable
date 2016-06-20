class CommentsMailer < ApplicationMailer
	default from: "cocoarocket@gmail.com"
	#default from: "avon@avon.taver.net"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.comments_mailer.submitted.subject
  #
  
  def submitted(comment)
    @comment = comment
=begin
    delivery_options = {
    	user_name: 						"cocoarocket@gmail.com",
		  password: 						"f0udl7z6A",
		  address:              "smtp.gmail.com",
      port:                 "587",
      domain:               "gmail.com",
      authentication:       :plain,
		}
=end
=begin
		delivery_options = {
		  user_name: "avon@avon.taver.net",
		  password: "tx87zfu5",
		  address: "smtp.locum.ru"
	  }
=end
    mail to: "vsting@inbox.ru", subject: "New comment! #{@comment.post.title}"#, delivery_method_options: delivery_options
  end
end
