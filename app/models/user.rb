class User < ApplicationRecord
    has_secure_password
    before_save :downcase_email

    has_many :messages
    has_many :comments

    validates :email, format: {with: URI::MailTo::EMAIL_REGEXP}, presence: true, uniqueness: true
  
    private
  
    def downcase_email
      self.email = email.downcase
    end
end
