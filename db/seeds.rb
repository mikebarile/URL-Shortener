# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

andrew = User.create(email: 'af@hotmail.com')
mike = User.create(email: 'mv@gmail.com')

google = ShortenedUrl.create(user_id: 1, short_url: "Goog.com", long_url: "www.google.com/home/page/website")
yahoo = ShortenedUrl.create(user_id: 2, short_url: "Yah.com", long_url: "www.yahoo.com/home/page/website")
zzz = ShortenedUrl.create(user_id: 2, short_url: "zzz.com", long_url: "www.yahoo.com/home/page/website")
