require 'bundler/setup'
require 'pry'
Bundler.require
require_rel '../app'

bobby = Follower.new("Bobby", 26, "YOLO!")
lewis = Follower.new("Lewis", 18, "Everything is fine.")
max = Follower.new("Max", 33, "I am Batman.")
carol = Follower.new("Carol", 40, "Tigers are life.")
bruce = Follower.new("Bruce", 32, "No, I'm Batman.")
shay = Follower.new("Shay", 20, "I am here.")
cody = Follower.new("Cody", 18, "I'm Cody.")
mac = Follower.new("Mac", 21, "I'm lovin' it!")
jan = Follower.new("Jan", 18, "Marsha, Marsha, Maarsha")
gwen = Follower.new("Gwen", 55, "I use to be a queen.")
mags = Follower.new("Margret", 28, "Oops!")
fido = Follower.new("Fido", 100, "Huh?")
bozo = Follower.new("Bozo", 77, "Clown stuff")

peoples_temple = Cult.new("The Peoples Temple", "Jonestown, Guyana", "Drink the Kool-aid!", 1955)
peoples_temple2 = Cult.new("The Peoples Temple", "Jonestown, Guyana", "Drink the Kool-aid!", 1955)
peoples_temple3 = Cult.new("The Peoples Temple", "Jonestown, Guyana", "Drink the Kool-aid!", 1955)
heaves_gate = Cult.new("Heaven's Gate", "San Diego, California", "So long and thanks for all the fish", 1972)
random_cult = Cult.new("Randy's Cult", "San Diego, California", "Randy is random", 2000)

oldest_blood_oath = BloodOath.new(random_cult, bozo, "1900-01-01")

bobby.join_cult peoples_temple
peoples_temple.recruit_follower lewis
max.join_cult peoples_temple
heaves_gate.recruit_follower carol
bobby.join_cult heaves_gate
bruce.join_cult peoples_temple 
bruce.join_cult peoples_temple2
bruce.join_cult peoples_temple3
bruce.join_cult heaves_gate
bruce.join_cult random_cult
shay.join_cult random_cult
cody.join_cult random_cult
mac.join_cult random_cult
jan.join_cult random_cult
gwen.join_cult random_cult
mags.join_cult random_cult


binding.pry