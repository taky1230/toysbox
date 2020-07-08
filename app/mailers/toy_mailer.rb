class ToyMailer < ApplicationMailer
  default from: "toysbox@example.com"
  
  def creation_email(toy)
    @toy = toy
    mail(
      subject: "Toy's Box登録完了メール",
      to: "user@example.com",
      from: "toysbox@example.com"
    )
  end
end
