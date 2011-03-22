class BandMailer < ActionMailer::Base
  default :from => "***REMOVED***"
  def extrainfo_email
    mail(:to => "tg90nor@gmail.com", :subject => 'Spørsmål til bandpresentasjon')
    bands = Band.all
    bands.each do |band|
      @band = band
      mail(:to => band.email, :subject => 'Spørsmål til bandpresentasjon')
    end
  end
end
