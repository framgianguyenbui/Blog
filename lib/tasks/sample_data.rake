namespace :db do
desc "Fill database with sample data"
task populate: :environment do

#make_users
make_microposts
make_relationships

end


def make_users
	admin = User.create!(name: "Super User",
	email: "super@rails.org",
	password: "qwerty",
	password_confirmation: "qwerty")
	admin.toggle!(:admin)

	30.times do |n|
	name = Faker::Name.name
	email = "example-#{n+1}@railstutorial.org"
	password = "qwerty"
	User.create!(name: name,
	email: email,
	password: password,
	password_confirmation: password)
	end
end

	
def make_microposts
	users = User.all(limit: 9)
	20.times do
	title  = Faker::Lorem.words(rand(2..10)).join(' ')
   	content  = Faker::Lorem.sentence(rand(2..8))
	users.each { |user| user.entries.create!(title: title, content: content) }
	end
end

def make_relationships
	users = User.all
	user = users.first
	followed_users = users[2..15]
	followers = users[3..10]
	followed_users.each { |followed| user.follow!(followed) }
	followers.each { |follower| follower.follow!(user) }
end


end