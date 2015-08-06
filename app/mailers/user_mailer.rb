class UserMailer < ApplicationMailer

  def contact_form(name, email, message)
    @message = message
    mail(:from => email, 
            :to => 'attycool@hotmail.com', 
            :subject => "A new contact message from #{name}")
  end
end
