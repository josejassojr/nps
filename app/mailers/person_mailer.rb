class PersonMailer < ApplicationMailer

 # had to add this here because for some reason wasn't being read from config/development.rb file using config.action_mailer.default_url_options
  def default_url_options
    { host: "localhost:3000" }
  end

  def nps(person)
    @person = person
    mail to: @person.email, subject: "Hello!" 
  end
end
