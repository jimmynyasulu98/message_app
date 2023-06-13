class PasswordMailer < ApplicationMailer

  def reset

    @token = params[:user].signed_id(purpose: 'password_reset', expires_in: 15.minutes)
  
    mail to: params[:user].email
  end

 
=begin  
def reset
    @greeting = "Hi"

    mail to: "to@example.org"
end
=end
 

end
