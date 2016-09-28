p "Gimme your email!"
email = gets.chomp
user = User.find_by(email: email)

choice = ""
until choice == 0
  p "Pick 1 for visit, 2 for make, 0 to quit"
  choice = gets.chomp.to_i

  if choice == 1
    p "what URL!?!?!?!?!"
    url = gets.chomp
    unless ShortenedUrl.get_by(short_url: url).nil?
      url_obj = ShortenedUrl.get_by(short_url: url)
      Visit.record_visit(user, url_obj)
      Launchy.open( url_obj.long_url )
    else
      Launchy.open( url_obj.url )
    end
  end

  if choice == 2
    p "What URL are we shortening!?!?!?!?!?!?!!"
    url = gets.chomp
    p short = ShortenedUrl.random_code
    p "^^^That's your new short URL, enjoy!!!!!!"
    ShortenedUrl.create_for_user_and_long_url!(user, url)
  end
end
