class ContactMailer < ActionMailer::Base
  default from: "vincent@vincethewalker.com"
  
  def contact_email(name, email, body)
    @name = name
    @email = email
    @body = body

    mail(from: email, subject: 'CDC Global has a Message')
  end
end
