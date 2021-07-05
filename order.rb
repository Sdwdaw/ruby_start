class Order

  attr_reader :items

  include ItemContainer

  def initialize
    @items = Array.new
  end

  def place
    thr = Thread.new do
      Pony.mail(
        :to => StoreApplication::Admin.email,
        :from => 'Ruby Start',
        :subject => "Test for Ruby Start",
        :body => "Hello from Ruby start.",
        :headers => { "Content-Type" => "multipart/mixed", "Content-Transfer-Encoding" => "base64", "Content-Disposition" => "attachment" },
        :via => :smtp, 
        :via_options => {
          :address        => 'smtp.gmail.com',
          :port           => '587',
          # :enable_starttls_auto => true,
          # :user_name      => 'jason.binwood@gmail.com',
          :user_name      => StoreApplication::Admin.email,
          # use your password or code for 2-step verification
          :password       => '',
          :authentication => 'plain',
          :domain         => 'mail.google.com'
          }
      )
    end
    while(thr.alive?)
      puts "."
      sleep(0.1)
    end
  end

end